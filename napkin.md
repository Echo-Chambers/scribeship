# Scribeship

## Broad Gameplay Concept Plans

1. Moving ship scroller game

2. Protect a mother starship containing a hero

3. Provide fuel, power, ammunition, rations and sometimes protection to your hero ship as they fight a dark menace.

4. 4 themed leveltypes with bosses at the end of each

## Narrower Gameplay Concept plans

#### Objects
Structure:
{
    id = 0,
    position = {},
    type = 'sprite',
    visual = 'texture.png',
    properties = {}
    events = {}
}

### 1. Controls

1. WASD key-input for movement using player motion tool.

2. Mousepress input for use of most tools.

### 2. Player

1. Graphically represented by the main scribeship

#### Player Object

Generic "ship" type object.
Properties:{
    image :: current animation frame for ship (will be based on rotation, firing-state, and config)
    position :: current position on grid
    properties :: physics parameters for things like velocity, weight, etc
    event :: generic object and player-specific functions (new, delete, permute etc.)
}



