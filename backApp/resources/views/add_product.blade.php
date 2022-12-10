<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" href="assets/css/product.css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="assets/js/product.js"></script>
    <title>Add product</title>
</head>
<body>
    <form method="post" action="{{ route('add-product') }}" enctype="multipart/form-data">
    @csrf
  <label>
    <p class="label-txt">ENTER YOUR PRODUCT NAME</p>
    <input type="text" class="input" name="productName">
    <div class="line-box">
      <div class="line"></div>
    </div>
  </label>
  <label>
    <p class="label-txt">ENTER YOUR PRODUCT PRICE</p>
    <input type="text" class="input" name="productPrice">
    <div class="line-box">
      <div class="line"></div>
    </div>
  </label>
  <label>
    <p class="label-txt">ENTER YOUR PRODUCT PERCENTAGE</p>
    <input type="text" class="input" name="productPercentage">
    <div class="line-box">
      <div class="line"></div>
    </div>
  </label>
  <label>
    <p class="label-txt">ENTER YOUR PRODUCT RANK</p>
    <input type="text" class="input" name="productRank">
    <div class="line-box">
      <div class="line"></div>
    </div>
  </label>
  <label>
    <p class="label-txt">ENTER YOUR PRODUCT RATE</p>
    <input type="text" class="input" name="productRate">
    <div class="line-box">
      <div class="line"></div>
    </div>
  </label>
  <label>
    <p class="label-txt">ENTER YOUR PRODUCT DESCRIPTION</p>
    <input type="text" class="input" name="productDescription">
    <div class="line-box">
      <div class="line"></div>
    </div>
  </label>
 
<label>
    <p class="label-txt">PRODUCT IMAGE</p>
    <input type="file" class="input" name="productimage">
    <div class="line-box">
      <div class="line"></div>
    </div>
  </label>
  <label for="productCategorie">PRODUCT CATEGORIE</label>

  <select name="productCategorie" id="productCategorie">
    <option value="beans">BEANS</option>
    <option value="gifts">GIFTS</option>
    <option value="machines">MACHINES</option>
    <option value="products">PRODUCTS</option>
  </select>
  
  <label for="productIsAvailable">PRODUCT AVAILIBILITY</label>
  <label for="" style="all: unset;">YES</label>
  <input type="radio" id="html" name="productIsAvailable" value="1">
  <label for="" style="all: unset;">NO</label>
  <input type="radio" id="css" name="productIsAvailable" value="0"><br>
  <button type="submit">submit</button>
  <form/>
</body>
</html>

