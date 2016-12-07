/*:
 # Mario
 
 Add your Mario solution (however far you got) to the space below.
 
 Then, commit your work.
 
 Finally, push your work to the remote origin for your repository on GitHub.com.
 
 We will go through this together.
 */
// Add your code below
import Foundation

func levelCost(heights: [Int], maxJump: Int) ->Int{
	var energy:Int = 0
	var jumpHeight:Int = 0
	
	//Iterate over all the heights
	for i in 0...(heights.count-2){
		
		//What is the jump height at this point?
		//Difference between current (i) and next (i+1)
		jumpHeight = heights[i+1]-heights[i]
		
		//Is the jumpHeiht "jumplable"?
		if jumpHeight <= maxJump{
			
			//We cab di tge jump, so...
			if jumpHeight==0{
				//Jumping across to another platform at same level
				energy += 1
			} else {
				//Add the energy taken to make this jump
				energy+=abs(jumpHeight*2)
			}
		} else {
			//Can't do this jump
			return -1
		}
	}
	
	//Returning the total engergy consumed to complete the level
	return energy
}
