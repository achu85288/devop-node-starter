import  express from "express";
import dotenv from "dotenv";
dotenv.config();

const app = express();

app.get('/', (req, res)=>{
    res.send("hello");
})

app.listen(process.env.PORT,()=>{
    console.log(`server is running on ${process.env.PORT}`)
})