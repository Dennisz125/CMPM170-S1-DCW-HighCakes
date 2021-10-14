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
    
    
    ->Intro


=== Intro ===
    The brisk autumn air nips at the crevices and creases of my weathered face as I recheck the notes I had written to myself earlier this morning. A coffee stain conceals the latter half of the address. 
    <i>This must be the place.</i>
    I trudge up the driveway of my childhood friend’s newly acquired mansion, my footsteps crunching against the hard gravel. A man dressed up in a tuxedo and top hat walks out to greet me, arms outstretched. 
    "Old sport, you've arrived! Come in, come in. I've an extravagant cake prepared, just for the occasion." 
    * [- skip intro (DEBUG) -] 
        -> Foyer 
    * [Banter] "Don't call me that." 
        Maximilian smiles and shakes his head, muttering, "No promises, old friend." 
        ** [Inquire] "Never mind that. Erm, you've done quite well for yourself. Lovely place. Say, whose truck is that outside?"
            "Ah, Mr. X! My specialist! I'm having the place cleansed of some dark energy. It's only routine maintenance, really." 
            *** [Doubt] "Cleansed? Now don't tell me you've fallen for that mumbo jumbo."
                "Oh, you just have to see for yourself. You'll feel the difference. Now, follow me into the foyer, we must get started on preparations for the evening! My butler will take your coat... Er, where is that chap anyway? Never mind, just hand it to me, I'll take care of it."
                I slip off my coat and hand it to Maximilian as we step inside. 
                **** [Enter Foyer]
                    -> FoyerIntro
               

=== Kitchen === 
    The refined warmth of the kitchen is overshadowed by the stench of a crime. My unshakeable instincts tell me a clue awaits here, ready to reveal the identity of the culprit.  
    The countertops house a blender and microwave. A high-tech fridge has seated itself in the corner. 
        + [Investigate Blender]
            -> Blender
        + [Investigate Microwave]
            -> Microwave
        + [Investigate Fridge]
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
    After seeing what happened to that poor cake... I couldn't imagine having an appetite. The food laid out in this room makes me ill. I'd better catch that culprit quick. 
    Max is here, and so is that exorcist... 
        + [Talk to Host]
            -> Host
        + [Talk to Exorcist]
            -> Exterminator
        + [Kitchen]
            -> Kitchen
        + [DEBUG]
            -> DEBUG


=== Foyer ===
    The once pristine velvet carpet is now stained with a blood-red strawberry filling, taken from this world far too soon... And quite a bit of vanilla frosting. I sample a taste from the mess, just to make sure. 
    The butler stands in the hall. 
    What remains of the cake lays on the pedestal. The scene is hidden behind the curtain, for Max's sanity. <i>Do I take a peak?</i>
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
    

=== ViewCake ===
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
