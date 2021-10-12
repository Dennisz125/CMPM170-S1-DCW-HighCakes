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
    
    LIST GhostKnowledgeList= None, Ghost, Demon
    VAR GhostKnowledge = GhostKnowledgeList.None
    
    LIST Time = Six, Seven, Eight, Nine
    // DELETE LATER quick way to test different time states 
    // ~ Time += Six
    // ~ Time += Seven
    // ~ Time += Eight
    // ~ Time += Nine
    
    //red herring for accusing appliances?
    
    // -- Butler Variables --  
    // whether butler has been talked to 
    VAR butler_met = false
    // times player selects hello option 
    VAR butler_hello = 0
    
    // -- Cake State: 0 is gone, 4 is full --
    VAR CakeState = 4
    
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
        -> NoteBook
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
    Here are all the clues you got so far
->->
    

===Cake===

    ->DiningRoom
-> Kitchen


