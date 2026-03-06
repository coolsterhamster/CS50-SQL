-- *** The Lost Letter ***
/*
Clerk, my name’s Anneke. I live over at 900 Somerville Avenue. Not long ago, I sent out a special letter. It’s meant for my friend Varsha.
She’s starting a new chapter of her life at 2 Finnegan Street, uptown. (That address, let me tell you: it was a bit tricky to get right the first time.)
The letter is a congratulatory note—a cheery little paper hug from me to her,to celebrate this big move of hers. Can you check if it’s made its way to her yet?
*/

/* CLUES:
- from '900 Somerville Avenue' -> address(addresses)
- a "congratulatory letter" -> content(packages)
---
1. Find the from_address_id that matches with the id of '900 Somerville Avenue'
2. Locate the package that contains the 'congratulatory letter'
3. Search for the to_address_id's id in addresses table
*/

SELECT a_from.address, a_to.address, a_to.type, p.contents, s.action, s.timestamp FROM addresses a_from
JOIN packages p ON a_from.id = p.from_address_id
JOIN addresses a_to ON p.to_address_id = a_to.id
JOIN scans s ON p.id = s.package_id
WHERE a_from.address = '900 Somerville Avenue'
AND p.contents = 'Congratulatory letter'


-- *** The Devious Delivery ***
/* Good day to you, deliverer of the mail. You might remember that not too long ago I made my way over from the town of Fiftyville.
I gave a certain box into your reliable hands and asked you to keep things low. My associate has been expecting the package for a while now.
And yet, it appears to have grown wings and flown away. Ha! Any chance you could help clarify this mystery? Afraid there’s no “From” address.
It’s the kind of parcel that would add a bit more… quack to someone’s bath times, if you catch my drift. */

/*CLUES:
- address is mystery -> address = NULL
- content is something duck?? -> contents(packages)
---
1. find package which has NULL from_address_id & get its id
2. use package's id to like with package_id in scan to find the Drop item, then get its address_id
3. use address_id from scan to search that address in addresses table
*/

SELECT p.contents, p.from_address_id, s.action, a.address FROM packages p
JOIN scans s ON p.id = s.package_id
JOIN addresses a ON s.address_id = a.id
WHERE from_address_id IS NULL
AND s.action = 'Drop'


-- *** The Forgotten Gift ***
/*
Oh, excuse me, Clerk. I had sent a mystery gift, you see, to my wonderful granddaughter, off at 728 Maple Place.
That was about two weeks ago. Now the delivery date has passed by seven whole days and I hear she still waits, her hands empty and heart filled with anticipation.
I’m a bit worried wondering where my package has gone.
I cannot for the life of me remember what’s inside, but I do know it’s filled to the brim with my love for her.
Can we possibly track it down so it can fill her day with joy? I did send it from my home at 109 Tileston Street.
*/

/* CLUES:
- address: '728 Maple Place' -> addresses.id = to_address_id
- address: '109 Tileston Street' -> addresses.id = from_address_id
---
1. match the package with the from and to id
2. use the package id to see where it had been scan
3. use the action to check which driver do it, then check the driver's name to see who got the flower now
*/

SELECT a.*, p.contents, s.package_id, s.address_id, s.action, s.timestamp, d.name
FROM addresses a_from
JOIN packages p ON a_from.id = p.from_address_id
JOIN addresses a_to ON p.to_address_id = a_to.id
JOIN scans s ON p.id = s.package_id
JOIN addresses a ON s.address_id = a.id
JOIN drivers d ON s.driver_id = d.id
WHERE a_from.address = '109 Tileston Street'
AND a_to.address = '728 Maple Place'
