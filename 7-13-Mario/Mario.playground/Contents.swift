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
	for i in 0...(heights.count-2){
		jumpHeight = heights[i+1]-heights[i]
		if jumpHeight <= maxJump{
			if jumpHeight==0{
				energy += 1
			} else {
				energy+=abs(jumpHeight*2)
			}
		} else {
			energy = -1
			break
		}
	}
	return energy
}