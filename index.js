
const express = require('express');

const app = express();
const port = 3000;

app.get("/",function (req,res)
	{
		res.send("hello from argo CD ");
	});


app.listen(port,() => console.log(`App runing on port ${port}`))
