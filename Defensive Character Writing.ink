INCLUDE Blender
INCLUDE Microwave
INCLUDE Butler
INCLUDE Host
INCLUDE Fridge
INCLUDE Exterminator
INCLUDE DEBUG
INCLUDE IntroRooms


-> Init 


=== Init === 
    // -- Player Knowledge States -- 
    LIST RaccoonKnowledgeList= NotAware, OutsideInfluence, InHouse, Dunnit
    VAR RaccoonKnowledge = RaccoonKnowledgeList.NotAware

    LIST BPlotList= None, Seance, Exorcist, FoundGhost, Conclusion
    VAR BPlot = BPlotList.None
    
    LIST CakeList = None, Some, Blood, Trail, RaccoonIn
    VAR Cake = CakeList.None
    VAR CakeKnowledge = CakeList.Some
    
    VAR Time = 0
    //Todo: Function to convert time
    Time: {UpdateTime()}
    //red herring for accusing appliances?
    
    
    // -- Butler Variables --  
    // whether butler has been talked to 
    VAR butler_met = false
    // whether player has asked butler who he is 
    VAR butler_who = false 
    // whether butler has been asked about host 
    VAR butler_host = false 
    // whether butler has been informed that something broke in 
    VAR butler_informed = false 
    // times player selects hello option 
    VAR butler_hello = 0
    
    // -- Microwave Variables -- 
    // whether microwave has been 'talked' to
    VAR microwave_met = false
    
    // -- Fridge Variables -- 
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
    
    // -- Blender Variables --  
    // whether blender has been used 
    VAR blender_met = false
    ->Intro


=== Intro ===
    The brisk autumn air nips at the crevices and creases of my weathered face as I recheck the notes I had written to myself earlier this morning. A coffee stain conceals the latter half of the address. 
    <i>This must be the place.</i>
    I trudge up the driveway of my childhood friend’s newly acquired mansion, my footsteps crunching against the hard gravel. A surprisingly familiar man dressed up in a tuxedo and top hat walks out to greet me, arms outstretched. 
    "Old sport, you've arrived! Come in, come in. I've an extravagant cake prepared, just for the occasion."
    <i>Maximillian?</i>
    * [- skip intro (DEBUG) -] 
        -> Foyer 
    * ["Don't call me that."] "Don't call me that." 
        Maximilian smiles and shakes his head, muttering, "No promises, old friend." 
        ** ["Lovely place."] "Never mind that. Erm, you've done quite well for yourself. Lovely place. Say, whose truck is that outside?"
            "Ah, Mr. X! My specialist! I'm having the place cleansed of some dark energy. It's only routine maintenance, really." 
            *** ["That mumbo jumbo?"] "Cleansed? Now don't tell me you've fallen for that mumbo jumbo."
                "Oh, you just have to see for yourself. You'll feel the difference. Now, follow me into the foyer, we must get started on preparations for the evening! My butler will take your coat... Er, where is that chap anyway? Never mind, just hand it to me, I'll take care of it."
                I slip off my coat and hand it to Maximilian as we step inside. 
                **** [Enter Foyer]
                    -> FoyerIntro
               

=== Kitchen === 
    ~Time += 0.25
    Time: {UpdateTime()} 
    {UpdateCake()}
    {Time >= 4:
        -> Failure
    }
    The refined warmth of the kitchen is overshadowed by the stench of a crime. My unshakeable instincts tell me a clue awaits here, ready to reveal the identity of the culprit.  
    The countertops house a blender and microwave. A high-tech fridge gently hums away in the corner. 
        + [Investigate Blender]
            -> Blender
        + {fridge_met}[Investigate Microwave]
            -> Microwave
        + {blender_met}[Investigate Fridge]
            -> Fridge
        + [Enter Dining Room] 
            -> DiningRoom
        + [Enter Foyer] 
            -> Foyer 
        // + [Open Notebook] 
        //     -> NoteBook ->
        + [DEBUG]
            -> DEBUG


=== DiningRoom ===
    ~Time += 0.25
    Time: {UpdateTime()} 
    {UpdateCake()}
    {Time >= 4:
        -> Failure
    }
    After seeing what happened to that poor cake... I couldn't imagine having an appetite. The food laid out in this room makes me ill... at least for now. I'd better catch that culprit quick. 
    Max is here, and so is that 'specialist' of his, Mr. X... 
        + [Talk to Host]
            -> Host
        + [Talk to Exorcist]
            -> Exterminator
        + [Kitchen]
            -> Kitchen
        + [DEBUG]
            -> DEBUG


=== Foyer ===
    ~Time += 0.25
    Time: {UpdateTime()} 
    {UpdateCake()}
    {Time >= 4:
        -> Failure
    }
    The once pristine velvet carpet is now stained with a blood-red strawberry filling, taken from this world far too soon... And quite a bit of vanilla frosting. I sample a taste from the mess, just to make sure. Delicious.
    The butler stands in the hall. 
    What remains of the cake lays on the pedestal. The scene is hidden behind the curtain, for Max's sanity. <i>Do I take a peek?</i>
        + [Talk to Butler]
            -> Butler
        + [Inspect Cake] 
            -> ViewCake
        + [Enter Kitchen] 
            -> Kitchen 
        + [DEBUG]
            -> DEBUG


=== NoteBook ===
    Here are all the clues you got so far.
    // Print out knowledge state
->->
    
=== function UpdateTime() ===
    {(Time%1 * 60) == 0:
         ~ return (FLOOR(Time) + 4) + ":00 o' clock"
    -else:
         ~ return (FLOOR(Time) + 4) + ":" + (Time%1 * 60) + " o clock"
    }

=== function UpdateCake() ===
    {
    -(Time < 0.5):
        ~Cake = CakeList.Some
        ~ return
    -(Time >= 0.5 and Time < 1):
        ~Cake = CakeList.Blood
        ~ return
    -(Time >= 1 and Time < 1.5):
        ~Cake = CakeList.Trail
        ~ return
    -(Time >= 1.5 and Time < 4):
        ~Cake = CakeList.RaccoonIn
        ~ return

    }

=== ViewCake ===
    // None, Some, Blood, Trail, RaccoonIn
    {
        - Cake == CakeList.None:
            Cake is Full
            ~ CakeKnowledge = CakeList.None
        - Cake == CakeList.Some:
            The once beautiful cake now stands without a head, chunks of frosting and strawberry filling still dripping from the wound.
            ~ CakeKnowledge = CakeList.Some 
        - Cake == CakeList.Blood:
            Smears and splatters of the cake filling are all over the it and the pedestal, emenating from a messy hole where it's heart would be.
            ~ CakeKnowledge = CakeList.Blood 
        - Cake == CakeList.Trail:
            A trail of frosting and gooey filling leads away from the cake pedestal, leading to the kitchen door... 
            ~ CakeKnowledge = CakeList.Trail 
        - Cake == CakeList.RaccoonIn:
            Watching the stomach of the headless cake squirm makes me nauseous. I need to get Max in here, quick.
            ~ CakeKnowledge = CakeList.RaccoonIn 
    }
    ->Foyer

=== Ending ===
    Max begins to protest my claims of an aberrant trash bandit in the house, but I’ve had enough of this supernatural nonsense. I grab Max by the collar of his tuxedo.
    “Hey! No need for violence, old chap!”
    I pull him through the elaborately carved doors into the foyer. Mr. X seems to be enjoying the show and follows suit.
    ”While you’ve spent the evening contacting the dead and trying to wish your problems away, I found <i>THIS</i>” 
    I stop with Max in front of the curtains of the cake’s pedestal. A bemused smirk sits on the butler’s face as he joins Mr. X in watching this scene unfold.
    “Old chap--” 
    
    *[Pull the curtain]
        I don’t give Maximillian any more chances to deny the truth. I give the rope a firm tug, pulling the curtains back to reveal the now thoroughly abused cake. Max gasps seeing the additional gore left by our furry friend.
        
        
        {BPlot == BPlotList.Conclusion:
            I level a finger at Mr. X. “<i>THIS</i> man here is nothing more than a scam artist, maximilian, and it seems he isn’t even a very good exterminator, either. All this seance and exorcism hullabaloo has just been distracting you, gouging you for as much money Mr. X can manage. I’m sorry, old friend, but this place isn’t haunted. It’s just a big lonely house, and you’re being taken advantage of.”
            Max looks deeply hurt by these words, refusing even to look at Mr. X who has a dumb, shocked look on his face. He sputters and stutters, but the butler puts a truly menacing hand on his shoulder, quieting him.
            Our eyes return to the messy murder scene before us.
            }
        
        
        The body of the cake warps and bulges, Max looks as if he’ll be sick, and Mr. X actually was sick on the once perfect red carpet. The butler groans and rolls his eyes.
        Amidst the commotion, the upper half of Max’s cake explodes, showering each of us with bits of fondant, icing, and a thick layer of strawberry filling. Sticking up from the remaining legs of the cake is a raccoon whose coat is now plastered by smears of red and white.
        
        Mr. X screams, “THEY’VE COME FOR REVENGE!”, before collapsing to the floor.
        The butler gives a chuckle, and Max stands before the ‘murderer’ stunned and shocked.
        In all the commotion the raccoon seems a bit startled, but makes no moves. It’s belly bulges more than Mr. X’s. It seems content where it is.
        
        **[“Well, Max, seems like someone really enjoyed your cake.”]
        
            I’m surprised to hear Maximillian start laughing. He turns and pulls me into a tight hug, and I start laughing with him. This is the friend I remember.
            As he pulls away tears are in his eyes. “Thank you, thank you! This may not have been the housewarming I wanted, but you’ve really made something special of it!”
            Max looks to the smug raccoon, belly full of frosting and filling.
            “This little rascal… well we might just have a spare room for it if it. Oh, Bart, could you go and get it cleaned up?”
            For the first time since I arrived, a smile breaks across the butler’s face. “Of course, sir. Right away.”
            
            Max begins to lead me back to the dining room, recalling a time in our earlier years when we would play detectives.
            
            “...And do you remember what you told your mother? You said, ‘Detectives don’t eat broccoli’, <i>HA!</i>”
            
            As he opens the door to the dining room a shrill <i>WeEeEe</i> pierces the foyer.
            
            “Um… sir?” Max and I turn to look at Bartholomew. In his arms lies the ‘murderer’... and a fresh litter of baby raccoons.
            
            “Oh.”

            -> END

===Failure===
I’m lost in thought, considering the evidence gathered so far. Who dunnit? A commotion from the foyer breaks me out of my trance, and I rush to catch the killer.
<i>They always return to the scene of the crime!</i>
As I burst through the door my heart drops. The rest of the guests have arrived.
[“Stop!”]
Before I can keep them at bay, a crowd of swanky folks waltzes through the door. The butler, serious as always, takes their coats. Seeing the pedestal hidden behind a velvet curtain, a would-be partygoer walks up and yanks on the rope.
Maximilian enters the room just in time to witness the shock and horror on each of their faces. One of his guests turns to him.
“Now Maxie, when you said you’d be having a dessert to die for we thought you meant in a <i>good</i> way. This joke of yours is simply boorish!”
The crowd gathers closer, hurling… insults I think? Before long, the foyer is empty and Maximillian looks to feel the same way. He sits beside the pedestal, head in hands.
“Old sport… I believe the party is over. You should see yourself out now.”
The butler appears at my side, coat in hand. A smirk makes his face even more haunting than usual.
“Hope you’ve had a pleasant stay, until next time...detective.”

-> END
    
