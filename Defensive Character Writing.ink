INCLUDE Blender
INCLUDE Microwave
INCLUDE Butler
INCLUDE Host
INCLUDE Fridge
INCLUDE Exterminator
INCLUDE DEBUG

-> Init 

=== Init === 
    // -- Player Knowledge States -- 
    LIST RaccoonKnowledgeList= NotAware, OutsideInfluence, Dunnit
    VAR RaccoonKnowledge = RaccoonKnowledgeList.NotAware

    LIST BPlotList= None, Seance, Exorcist, Conclusion
    VAR BPlot = BPlotList.None
    
    LIST CakeList = None, Some, Blood, Trail, RaccoonIn
    VAR Cake = CakeList.None
    VAR CakeState = 4
    
    VAR Time = 1700 //Military time
    //Todo: Function to convert time
    Time: {Time}
    //red herring for accusing appliances?
    
    
    // -- Butler Variables --  
    // whether butler has been talked to 
    VAR butler_met = false
    // whether player has asked butler who he is 
    VAR butler_who = false 
    // whether butler has been asked about host 
    VAR butler_host = false 
    // times player selects hello option 
    VAR butler_hello = 0
    
    //fridge variables
    VAR fridge_met = false
    // whether player has asked fridge who he is 
    VAR fridge_who = false 
    // whether fridge has been asked about host 
    VAR fridge_host = false 
    // times player selects hello option 
    VAR fridge_hello = 0
    
    // -- Exterminator Variables --  
    // whether Exterminator has been talked to 
    VAR exterminator_met = false
    // whether player has asked Exterminator who he is 
    VAR exterminator_who = false 
    // whether Exterminator has been asked about host 
    VAR exterminator_host = false 
    // times player selects hello option 
    VAR exterminator_hello = 0
    
    
    //fridge variables
    //VAR fridge_met = false
    
    VAR kitchen_visited = false
    VAR foyer_visited = false
    VAR dining_visited = false
    
    // TODO divert to beginning of story 
    ->Intro

===Intro===
    
->Kitchen

===Kitchen===
    {(not kitchen_visited):
        “So what do you think, old chap? Take a look around, mi casa es su casa and all that.” Maximilian rummages around in one of the nearby drawers for something, giving me a chance to look around the kitchen, which I’m almost positive I’ve seen in a cooking magazine somewhere.
        The pristine white doors open to reveal a perfectly well kept room of black and white checkered tile floors and rosy pink granite countertops. Along the wall to the right is a row of several too many chrome stoves and counters home to a few state-of-the-art appliances. To the left is a wall dedicated to a vast pantry and a gargantuan silver refrigerator with a high-tech looking visual display on one of it’s several doors. 
        * ["Fancy"]
            It’s a deceptively long walk across the kitchen to the large bay window looking out onto the sprawling estate. The view is broken only by a small copse of dark oak trees across the manicured lawns behind Maximillian’s mansion. A brisk wind blows through the smaller window to the side of the first. A shiver runs down my spine.
            The refined look of the kitchen is now overshadowed by the stain of a murder, and though things seem to be in order here, I can’t shake the feeling that a clue might be waiting here which could reveal the villain’s identity…
            ** [shut window]
                Maximilian may not have to worry about the heating bill, but I won’t have a butler to tend to me if I catch a cold.
                “Oh sorry about that, there’s just nothing quite like the smell of freshly trimmed hedges with your afternoon tea, isn’t that right, Bartholomew? The butler responds ”Right you are, sir.” He inclines his head, the serious look on his face never wavering.
                 *** So… what’s next?”
                    [max] “I’m so glad you asked, my friend! Let me show you to the Dining Room, after all, a good host must serve more than just dessert!” Maximilian begins walking towards another polished silver door across the room from the fridge.
                    ~ kitchen_visited = true
                    ->Kitchen
    - else:
        The refined look of the kitchen is now overshadowed by the stain of a murder, and though things seem to be in order here, I can’t shake the feeling that a clue might be waiting here which could reveal the villain’s identity…
        + [Talk to Blender]
            ->Blender
        + [Talk to Microwave]
            ->Microwave
        + [Talk to Fridge]
            ->Fridge
        + [Dining room] 
            ->DiningRoom
        + [Foyer] 
            -> Foyer 
        // + [Open Notebook] 
        //     -> NoteBook ->
        + [DEBUG]
            ->DEBUG
    }

    
    
===DiningRoom===
    {(not dining_visited):
        As we enter the dining room a wave of delectable scents washes over us. My mouth just about explodes from the aroma of roasted chickens, a whole roasted hog with an obligatory apple in-mouth, baskets of freshly baked bread, and an absolute smorgasbord of beautiful dishes which could feed a village. How was the kitchen so clean after this nightmare of prep work? At this point the butler truly was a terrifying figure. Maximillians throws his arm around my shoulder and jostles me a bit.

	    [max]”Well? Is this not a feast fit for my housewarming? I’ve spared no expense, and if you find yourself wanting to eat something which we haven't prepared here, well then I might just have to sign the deed over to you instead!”

        Maximilian wasted no time in walking me about, pointing out dishes and hors d'oeuvres as we go. The rich wooden paneling on the walls, extravagant rug on the floor, and hand carved table and chairs are somewhat overwhelming just on their own. Several crystal chandeliers hang over the table, which could go on seemingly forever. Velvet cushions beckon, and I feel like if I sat down and started eating I might just have to die here at this table.
        
        Maximillian chuckles at the look of wonder on my face.
        
	    ”You look like you’ve seen a delicious ghost, old friend! Help yourself to anything you’d like.
	    
	    After several moments of contemplation I reach for a nearby basket of bread. Probably better to go easy before the party even starts. Before I can take a truly perfect dinner roll, bell tolls from somewhere else in the mansion. Maximilian looks up excitedly and drags you to the door.

	    ”Plenty of time for food later, but you simply MUST meet my next guest! They’re a detective, too… Well, in a less formal capacity, at least. Come, come!”
	    
	    I look back longingly at the dining room as he drags me away. I look to the rolls waiting there.

        *[“I’ll see you later…”]
            ~ dining_visited = true
            ->DiningRoom

    
    
    -else:
        + [Talk to Host]
            ->Host
        + [Talk to Exterminator]
            ->Exterminator
        + [Inspect cake]
            ->Cake
        + [Kitchen]
            ->Kitchen
    }
->END

=== Foyer ===
    {(not foyer_visited):
        The once pristine velvet carpet is now stained by blood, a strawberry filling which was taken from this world far too soon… and quite a bit of frosting. Maximilian’s once-immaculate cake lay in shambles on it’s pedestal. The foyer is eerily quiet as I enter, searching for clues as to what monster might have enacted such a hateful attack against our host… or the confectionary version of him, at least.
        + [Talk to Butler]
            -> Butler
        + [Go to Kitchen] 
            -> Kitchen 
    -else: 
        The inside of Maximillian’s Mansion looks more like a museum than a home at first. Marble statues periodically line the walls, and a wide staircase leads to the second and third floors. At the center of the landing to the second floor there’s a portrait of Maximillian sitting with hands crossed in a velvet chair, framed by gold. Of course. Max leads me along a literal red carpet which leads away from the stairs and towards a polished metallic door. He seems more interested in having guests than the lavish lodging he came into so recently.

	    “Tell me, old chap, how has that detective thing been treating you? We simply Must catch up, it’s been too long!”

        *[”Well…”]
            Thankfully the butler interjects before you can get a word in. Your lifelong dream of becoming a detective seems a bit dull compared to the insane wealth Maximillian inherited last year.
	        The butler gives you a concerning look of what might be bloodlust or just a wide, dead-eyed stare as he brushes past.
	        “Sir, I thought you’d like to know that the preparations for this evenings… guests are complete,” He gives you a distasteful look up and down as he refers to the partygoers, then motions towards a large pedestal in the center of the Foyer, its occupant hidden behind yet another red velvet curtain.
            “Oh thank you, Bartholomew!” Max looks my way, a wild look in his eye. “I’ve had the MOST wonderful dessert prepared for you and the other guests tonight! I’ve already seen the handiwork, and I must say that it looks positively to die for!”

            **[“I certainly hope not.”] 
                You glance at the terrifying butler for a moment before Maximillian lets out something between a squeal of delight and laughter.

    	        ”Oh old chap, your humor and wit shall surely bring some life to this old, dead house! Come, let me show you where all the best work happens here.” He starts walking towards the metallic doors along the right side of the enormous foyer. A small circular window reveals a few pots and pans hanging from the ceiling on the other side.

                ***”The kitchen?”
                    ”Now there’s that detective brain of yours! I can’t wait for you to see!”
                    ->Kitchen
    }

===NoteBook===
    Here are all the clues you got so far.
    // Print out knowledge state
->->
    

===ViewCake===
    // None, Some, Blood, Trail, RaccoonIn
    {
        - Cake == CakeList.None:
            Cake is Full
        - Cake == CakeList.Some:
            Cake lost some toppings
        - Cake == CakeList.Blood:
            Cake lost some pieces
        - Cake == CakeList.Trail:
            Crumbs from the Cake is gone
        - Cake == CakeList.RaccoonIn:
            There's a raccoon in the Cake
        }
->->
>>>>>>> Stashed changes

    ->DiningRoom
-> Kitchen


