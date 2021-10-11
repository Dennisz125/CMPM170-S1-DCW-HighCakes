INCLUDE Blender
INCLUDE Microwave
INCLUDE Butler
INCLUDE Host
INCLUDE Fridge
INCLUDE Exterminator

-> Init 


=== Init === 
    //Player Knowledge States
    LIST RaccoonKnowledge= NotAware, OutsideInfluence, Dunnit
    ~RaccoonKnowledge = RaccoonKnowledge.NotAware
    
    LIST BPlot= None, Seance, Exorcist, Conclusion
    ~BPlot = BPlot.None
    
    LIST GhostKnowledge = NONE, Ghost, Demon
    
    LIST Time = Six, Seven, Eight, Nine
    
    //red herring for accusing appliances?
    
    // whether butler has been talked to 
    // -DELETE EXPLANATION LATER- there is a built-in test for whether a knot has been visited, but this didn't work because the initial text still shows up after every time you ask him a question if it's the first time you enter that knot, which gets repetitive and it's a big block of text
    VAR butler_met = false
    -> Kitchen



-> Kitchen
===Kitchen===
    You are in the kitchen. Where do you want to go?
    *Blender ->Blender
    *Notebook ->NoteBook
    +Dining room ->DiningRoom
    + [Foyer] 
        -> Foyer 

    
    
===DiningRoom===
    You are in the dining room
    +Kitchen -> Kitchen

->END

=== Foyer ===
    // TODO add cool text with a short description of the foyer  
    Boy this sure is a foyer. 
    + [Talk to Butler]
        -> Butler


===NoteBook===
    Here are all the clues you got so far

-> Kitchen


