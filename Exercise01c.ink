/*
This is a comment block. It won't be read as an Ink story.
Comments are very useful for leaving ideas for story and functionalty

This exercise will demonstrate the following in the example video:
 *Variable types: integer, float, boolean
 * Variable assignment
 * Printing variables
 * Variable checking
 
 In the assignment:
 *Add four more knots
 - Assign at least TWO new variables through player choices
 - Print at least one of the variables to the player in a passage
 - Check the value of a variable and have it do something
 
 
 Variable Checking:
 
 Equality:  "Spot" == "Spot"
 Not equality: 1 != 2
 Greater: >
 Less: <
Great or equal: >=
Less or equal: <=
 
 
 
*/

VAR health = 10
VAR pet_name = ""
VAR torches = 0
 

-> memory

== memory ==
Before you stands the cavern of Josh. You wish your childhood pet was with you now. The cave might be less intimidating then. What was your pet's name?

* [Charlie]
~ pet_name = "Charlie" 
-> cave_mouth
* [Susan]
~ pet_name = "Susan"
-> cave_mouth
* [Spot]
~ pet_name = "Spot"
-> cave_mouth

== cave_mouth ==
You are at the enterance to a cave. {not torch_pickup:There is a torch on the floor.} The cave extends to the east and west.

You made it to the cave. If only {pet_name} could see you now!
You have {health} health
You have {torches} torches

+ [Take the east tunnel] -> east_tunnel
+ [Take the west tunnel] -> west_tunnel
* [Pick up the torch] -> torch_pickup

== east_tunnel ==
You are in the east tunnel. It is very dark, you can't see anything.
You have {health} health
* {torches > 0} [Light Torch] -> east_tunnel_lit
+ [Go Back] -> cave_mouth
-> END

== west_tunnel ==
You are in the west
You have {health} health

{pet_name == "Spot": Spot would love it here in the west| }
{pet_name == "Susan": -> ghost_dog}
+ [Go Back] -> cave_mouth
-> END

== ghost_dog ==
Susan always had a good sniffer for finding hidden things in our yard. You close your eyes and imagine Susan in the cave with you. When you open your eyes again you see a transparent green figure trot on all fours over to a wall. 
* [Follow your ghost dog?] -> secret_west
-> END

== secret_west ==
You follow your ghost dog who is now panting next to a light colored stone wall. You knock on the wall and hear that its hollow. You start kicking into it with the heel of your shoe. Piece by piece the wall slowly breaks apart leaving a small hole.
* [Go through the hole?] -> long_fall
-> END

==long_fall==
You begin crawling through the hole in the wall and the next thing you know you are falling, fast. 
This landing might hurt.
AHHHHHHHHH
AHHHH
AHHH
AHHH
AHHH
AHHHHHHHHHHHH

->lake_und
->END

==lake_und==
PLUNGE! You fall right into an underground lake and once you get submerged in the shimmering water you feel yourself get stronger.
~health = health +3 
 -> power_up
->END

=== torch_pickup ===
~ torches = torches + 1
You now have a torch. May it light the way.
* [Go Back] -> cave_mouth
-> END

===health_amt===
*{health > 10} [Power UP!] -> power_up


==power_up==
You have {health} health 
You feel revitalized and feel the blood coursing through your veins at incredible speeds like lightning. You can not handle this power. It feels quicker and quicker UNTIL eventually you explode.
->END

== east_tunnel_lit ==
The light of your torch glints off of the thousands of coins in the room.
-> END