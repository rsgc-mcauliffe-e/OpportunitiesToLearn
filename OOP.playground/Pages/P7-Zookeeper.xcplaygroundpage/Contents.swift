/*:
 ![Make School Banner](./swift_banner.png)
 # An automatic Zookeeper

 Zoe went in to pet the bees on her lunch break and nobody has seen her since! The animals haven't been fed, and they're getting hungry. Let's make your program more useful so that it can help any zookeeper keep track of all the animals they feed each day.

 But first, let's copy over your animal classes from the previous page...

 */

// Copy your Animal class here
class Animal {
	// Put your instance variables here
	let name: String
	let favouriteFood: String
	
	init(name: String, favouriteFood: String) {
		// put your initializer content here
		self.name = name
		self.favouriteFood = favouriteFood
	}
	
	func sleep() {
		// complete your sleep function here, noting the change from global to instance variables
		print("\(self.name) sleeps for 8 hours")
	}
	
	func eat(food: String) {
		// complete your eat function here!
		print("\(self.name) eats \(food)")
		if food == self.favouriteFood {
			print("YUM!!! \(self.name) wants more \(food)")
			
		} else {
			self.sleep()
		}
	}
}

class Tiger: Animal {
	
	init(name: String) {
		// don't forget to correct the call to the superclass initializer!
		super.init(name: name, favouriteFood: "meat")
	}
	
}

class Bear: Animal {
	// complete the Bear class here, using the completed Tiger class as an example
	init(name: String) {
		super.init(name: name, favouriteFood: "fish")
	}
	
	// here, we override the sleep function
	override func sleep() {
		// add in your Bear-specific sleep code here
		print("\(self.name) hibernates for 4 months.")
	}
}
// Copy your Unicorn class here
class Unicorn: Animal {
	
	init(name: String) {
		// don't forget to correct the call to the superclass initializer!
		super.init(name: name, favouriteFood: "marshmallows")
	}
	
	override func sleep() {
		// your overridden sleep code...
		print("\(self.name) sleeps in a cloud")
	}
}


// Copy your Giraffe class here
class Giraffe: Animal {
	
	init(name: String) {
		// don't forget to correct the call to the superclass initializer!
		super.init(name: name, favouriteFood: "leaves")
	}
	
	override func eat(food: String) {
		// check here if you don't like the food you were given...
		// don't forget a call to the superclass eat function!
		if (food == "meat"){
			print("YUCK!!! \(self.name) will not eat \(food)")
		} else {
			super.eat(food: food)
		}
	}
}

// Copy your Bee class here
class Bee: Animal {
	init(name: String) {
		// don't forget to correct the call to the superclass initializer!
		super.init(name: name, favouriteFood: "pollen")
	}
	override func eat(food: String) {
		if (food != favouriteFood) {
			print("YUCK!!! \(self.name) will not eat \(food)")
		} else {
			super.eat(food: food)
		}
	}
	override func sleep(){
		print("\(self.name) never sleeps")
	}
	
}

/*:

 # Zookeeper

 Great! Now, we're ready to create a `Zookeeper` class that contains a `name` instance variable and an initializer method that sets `name` using an argument. A zookeeper needs to feed many animals each day, so let's add a `feedAnimals` method, which should take two arguments: `animals` – an array of `Animal`s, and `food` – a string. This method should first print `"<name> is feeding <food> to <animals.count> animals"`, then iterate over the array of animals and call each animal's `eat` method, passing the value of `food` as the argument.

 Finally, call this `feedAnimals` method, using an array containing an instance of each animal, and your own favorite food.

 - callout(Challenge): Finish the `Zookeeper` class below!

 */

// Implement the Zookeeper class here
class Zookeeper {
    // put instance variables here
	let name:String
	
    init(name: String) {
        // save name to an instance variable
		self.name = name
    }

    func feed(animals: [Animal], food: String) {
        // complete your feedAnimals function here.
		print("\(self.name) is feeding \(food) \(animals.count) animals")
		for animal in animals {
			animal.eat(food: food)
			
		}
    }
}

/*:
 ## Testing

 The test code below should output exactly this:

     ZoeBot is feeding meat to 5 animals
     Tigger eats meat
     YUM!!! Tigger wants more meat
     Pooh eats meat
     Pooh hibernates for 4 months
     Rarity eats meat
     Rarity sleeps in a cloud
     YUCK!!! Gemma will not eat meat
     YUCK!!! Stinger will not eat meat

 - callout(Hint): Create a `Zookeeper` instance with the name `"ZoeBot"`. Create an `Array` containing the animals from the previous page's test code. Pass the array to the `Zookeeper`'s `feedAnimals` method along with `"meat"`.

 */

let animals: [Animal] = [
    Tiger(name: "Tigger"),
    Bear(name: "Pooh"),
    Unicorn(name: "Rarity"),
    Giraffe(name: "Gemma"),
    Bee(name: "Stinger")
]
let zookeeper = Zookeeper(name: "ZoeBot")
zookeeper.feed(animals: animals, food: "meat")

//: [Previous](@previous) | [Next](@next)
