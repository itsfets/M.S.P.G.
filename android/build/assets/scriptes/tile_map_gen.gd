extends Node2D
@export var noise_text:NoiseTexture2D
@export var tile_size:Vector2i
var noise:Noise
var height:int
var width:int

func _ready():
  noise_text.noise.seed=randi()
  noise=noise_text.noise
  width=get_viewport_rect().size.x/tile_size.x+1
  height=get_viewport_rect().size.y/tile_size.y+1
  _generate()

func _generate():
  for x in range(width):
    for y in range(height):
      var noise_val:float = noise.get_noise_2d(x,y)
      if noise_val<-0.6:
        $TileMap.set_cell(0,Vector2i(x,y),0,Vector2i(0,0),0)
      elif noise_val<-0.4:
        $TileMap.set_cell(0,Vector2i(x,y),0,Vector2i(1,0),0)
      elif noise_val<-0.2:
        $TileMap.set_cell(0,Vector2i(x,y),0,Vector2i(2,0),0)
      elif noise_val<0:
        $TileMap.set_cell(0,Vector2i(x,y),0,Vector2i(3,0),0)
      elif noise_val<0.2:
        $TileMap.set_cell(0,Vector2i(x,y),0,Vector2i(0,1),0)
      elif noise_val<0.4:
        $TileMap.set_cell(0,Vector2i(x,y),0,Vector2i(1,1),0)
      elif noise_val<0.6:
        $TileMap.set_cell(0,Vector2i(x,y),0,Vector2i(2,1),0)
      else:
        $TileMap.set_cell(0,Vector2i(x,y),0,Vector2i(3,1),0)
