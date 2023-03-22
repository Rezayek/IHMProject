// Import the Firebase SDK and initialize it with your project credentials
const firebase = require("firebase/app");
require("firebase/firestore");
// Initialize Firebase
const firebaseConfig = {
    apiKey: "AIzaSyC7R9rw12OXzES_jGnrPkrwMA7YVH71irA",
    authDomain: "ihmproject-a1a57.firebaseapp.com",
    projectId: "ihmproject-a1a57",
    storageBucket: "ihmproject-a1a57.appspot.com",
    messagingSenderId: "808890816088",
    appId: "1:808890816088:web:51d6f38e54963ba1a1dc2d"
  };
  firebase.initializeApp(firebaseConfig);
  
  // Get a reference to the products collection in your Firebase database
  const productsRef = firebase.firestore().collection('Products');
  
  // Add an event listener to the form submit button
  document.getElementById('add-product-form').addEventListener('submit', (event) => {

    event.preventDefault(); // Prevent the form from submitting normally
  
    // Get the values of the form fields
    const productName = document.getElementById('product-name').value;
    const productDescription = document.getElementById('product-description').value;
    const productImageUrl = document.getElementById('product-image-url').value;
    const productPrice = parseFloat(document.getElementById('product-price').value);
    const productPercentage = parseFloat(document.getElementById('product-percentage').value);
    const productRank = parseInt(document.getElementById('product-rank').value);
    const productRate = parseFloat(document.getElementById('product-rate').value);
    const productIsAvailable = parseFloat(document.getElementById('product-is-available').value);
    const productCategory = parseFloat(document.getElementById('product-category').value);


    // Create a new product object with the form values
    const newProduct = {
        productName: productName,
        productDescription: productDescription,
        productImageUrl: productImageUrl,
        productPrice: productPrice,
        productPercentage: productPercentage,
        productRank: productRank,
        productRate: productRate,
        productIsAvailable: productIsAvailable,
        productCategory: productCategory
        };
    let categorieRef ;      
    switch(productCategory){
        case "beans":
            categorieRef = productsRef.doc("Beans").collection("BeansProducts");
        case "machines":
            categorieRef = productsRef.doc("Machines").collection("MachinesProducts");
        case "products":
            categorieRef = productsRef.doc("ProductsItems").collection("ProductsProducts");
        case "gifts":
            categorieRef = productsRef.doc("Gifts").collection("GiftsProducts");
    }
    // Add the new product to the Firebase database
    categorieRef.add(newProduct)
    .then((docRef) => {
    console.log("Product added with ID: + " + docRef.id);
    // Reset the form after successfully adding the product
    document.getElementById('add-product-form').reset();
    })
    .catch((error) => {
    console.error("Error adding product:" + error);
    });
    }
    
    
    );