const multer = require('multer');

const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, 'public/uploads/')
  },
  filename: function (req, file, cb) {
    cb(null, Date.now() + '-' + file.originalname)
  }
});

const upload = multer({ storage: storage });

const express = require('express');
const app = express();

// Serve static files from the 'public' directory
app.use(express.static('public'));

// Start the server
app.listen(3000, '192.168.1.7', () => {
  console.log('Server listening on port 3000');
});

app.get('/uploads/:filename', (req, res) => {
  const { filename } = req.params;
  res.sendFile(`${__dirname}/public/uploads/${filename}`);
});


app.post('/upload', upload.single('image'), (req, res) => {
    res.send('File uploaded successfully!');
  });