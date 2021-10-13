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
    
    
    // -- Cake State: 0 is gone, 4 is full --
    VAR CakeState = 4
    
    VAR KitchenVisits = 0
    VAR FoyerVisits = 0
    VAR DiningVisits = 0
    
    ->Intro


===Intro===
    The brisk autumn air nips at the crevices and creases of my weathered face as I recheck the notes I had written to myself earlier this morning. A coffee stain conceals the latter half of the address. 
    <i>This must be the place.</i>
    I trudge up the driveway of my childhood friend’s newly acquired mansion, my footsteps crunching against the hard gravel. A man dressed up in a tuxedo and top hat walks out to greet me, arms outstretched. 
    "Old sport, you've arrived! Come in, come in. I've an extravagant cake prepared, just for the occasion." 
    "Don't call me that." 
    Maximilian smiles and shakes his head, muttering, "No promises, old friend." 
    "Never mind that. Erm, you've done quite well for yourself. Lovely place. Say, whose truck is that outside?"
    "Ah, Mr. Ex! My specialist! I'm having the place cleansed of some dark energy. It's only routine maintenance, really." 
    "Cleansed? Now don't tell me you've fallen for that mumbo jumbo." 
    "Oh, you just have to see for yourself. You'll feel the difference. Now, follow me into the foyer, we must get started on preparations for the evening! My butler will take your coat... Er, where is that chap anyway? Never mind, just hand it to me, I'll take care of it."
    I slip off my coat and hand it to Maximilian as we step inside. 
    
    -> Kitchen 


===Kitchen===
    You are in the kitchen
    
    Exterminator: {GetExterminatorQuotes()}
    
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
    + [Open Notebook] 
        -> NoteBook ->
    + [DEBUG]
        ->DEBUG

    
    
===DiningRoom===
    You are in the dining room
    + [Talk to Host]
        ->Host
    + [Talk to Exterminator]
        ->Exterminator
    + [Inspect cake]
        ->Cake
    + [Kitchen]
        ->Kitchen
->END

=== Foyer ===
    // TODO add cool text with a short description of the foyer  
    Boy this sure is a foyer. 
    + [Talk to Butler]
        -> Butler
    + [Go to Kitchen] 
        -> Kitchen 


===NoteBook===
    Here are all the clues you got so far.
    // Print out knowledge state
->->
    

===ViewCake===

    ->DiningRoom
-> Kitchen


