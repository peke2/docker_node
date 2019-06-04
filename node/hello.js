const http = require('http');

const hostname = '127.0.0.1';
const port = 3000;

const server = http.createServer((req, res)=>{
	res.statusCode = 200;
	res.setHeader('Content-type', 'text/plain');
	res.end('ハローNode.js\n');
});

//	hostname の指定があると、対象のホスト以外からのアクセスを拒否する
//server.listen(port, hostname, ()=>{
server.listen(port, ()=>{
	console.log(`Server running at http://${hostname}:${port}/`);
});
