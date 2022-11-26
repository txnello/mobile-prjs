from fastapi import FastAPI, UploadFile, Form, File
from typing import Union
import requests, json, pyrebase, datetime

fireBaseConfig = {
    'apiKey': "AIzaSyD0C6A-hLdSx-7MU22MGJWAwXgRMtfKC7U*",
    'authDomain': "write-it-down-app.firebaseapp.com",
    'databaseURL': "https://write-it-down-app-default-rtdb.europe-west1.firebasedatabase.app",
    'projectId': "write-it-down-app",
    'storageBucket': "write-it-down-app.appspot.com",
    'messagingSenderId': "643200832832",
    'appId': "1:643200832832:web:b6c535e4e429eb82b196a5"
}

firebase = pyrebase.initialize_app(fireBaseConfig)
auth = firebase.auth()
db = firebase.database()

app = FastAPI()

def uploadImgur(cover: object):
    if type(cover) == str:
        return cover

    cover.file.seek(0)
    contents = cover.file.read()

    x = requests.post(
        "https://api.imgur.com/3/image",
        headers = {
            "Authorization": "Client-ID 2e44ec3a6d3b65c"
        },
        data = {
            "image": contents
        }
    )
    return json.loads(x.text)["data"]["link"]

@app.get("/")
async def root():
    return {"/docs": "documentation"}

@app.get("/getNotes")
async def getNotes():
    data = db.get()
    notelist = []
    
    for k in data.each():
        data = k.val()
        data["id"] = k.key()
        notelist.append(data)
    return {"response": notelist}

@app.delete("/delNote/{id}")
async def delNote(id: str):
    db.child(id).remove()
    return {"/delNotes": "delNotes"}

@app.put("/updNote/{id}")
async def updNote(id: str, title: str = Form(), text: str = Form(), date: str = Form(), cover: Union[UploadFile, str] = File(...)):
    imgUrl = uploadImgur(cover = cover)

    db.update({
        id: {
            'title': title,
            'text': text,
            'date': date,
            'cover': imgUrl
        }
    })
    return {"/updNote": "updNote"}

@app.post("/newNote")
async def newNote(title: str = Form(), text: str = Form(), cover: Union[UploadFile, str] = File(...)):
    imgUrl = uploadImgur(cover = cover)

    today = datetime.datetime.now()
    date = str(today.day) + "/" + str(today.month) + "/" + str(today.year)

    db.push({
        'title': title,
        'text': text,
        'date': date,
        'cover': imgUrl
    })
    
    return {"/newNote": "newNote"}