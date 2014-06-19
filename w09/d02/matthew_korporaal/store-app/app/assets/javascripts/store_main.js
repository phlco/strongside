var store = new Store("ThinkGeek");

// var item =  new Item("Giant Plush Angry Bird", 40.00);

store.addItem(item); // way 1
store.createItem("Giant Plush Angry Bird", 40.00); // way 2
store.getItems() // gives me all the tiems
var item = store.getItem("Angry Bird")

var user = store.createUser("Jonathan Leung", "me@jonl.org"); //address, credit card
user.cart.add(item, 5);
user.cart.calculateTotal(); //sum up the cost of all the items
user.cart.total; // auto incrementing total
user.cart.checkout(); // clears out the cart and bills you and removes them from the store as well
user.cart.remove(item);

// function add(x, y, z) {

// }

// add(1,2);
