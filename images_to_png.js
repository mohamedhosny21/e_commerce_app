const jsonServer = require('json-server');
const sharp = require('sharp');

const server = jsonServer.create();
const router = jsonServer.router('db.json');
const middlewares = jsonServer.defaults();

server.use(middlewares);

// Custom middleware to convert images to PNG
server.use((req, res, next) => {
  if (req.method === 'GET' && req.url.startsWith('/path/to/images')) {
    // Modify the '/path/to/images' to match the URL where your images are stored
    const imagePath = `.${req.url}.jpg`; // Assuming the original images are in JPEG format

    sharp(imagePath)
      .toFormat('png')
      .toBuffer()
      .then((data) => {
        res.setHeader('Content-Type', 'image/png');
        res.send(data);
      })
      .catch((err) => {
        console.error(err);
        res.status(500).send('Error converting image to PNG');
      });
  } else {
    next();
  }
});

server.use(router);

const port = 3000; // Change to the desired port number
server.listen(port, () => {
  console.log(`JSON Server is running on port ${port}`);
});