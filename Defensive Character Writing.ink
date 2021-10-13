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
    
    // TODO divert to beginning of story 
    ->Intro

===Intro===
Exterminator: {GetExterminatorQuotes()}
->Kitchen

===Kitchen===
    You are in the kitchen
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


