extends Node2D
@export var noise_text:NoiseTexture2D
@export var tile_size:Vector2i
var noise:Noise
var height:int
var width:int
func _ready():
  noise_text.noise.seed=randi()
  noise=noise_text.noise
  width=get_viewport_rect().size.x/(scale.x*tile_size.x)+1
  height=get_viewport_rect().size.y/(scale.y*tile_size.y)+1
  _generate()
func _generate():
  for x in range(width):
    for y in range(height):
      var noise_val:float = noise.get_noise_2d(x,y)
      if noise_val<-0.3:
        $TileMap.set_cell(0,Vector2i(x,y),0,Vector2i(0,0),randi_range(0,3))
      elif noise_val<-0.2:
        $TileMap.set_cell(0,Vector2i(x,y),0,Vector2i(1,0),randi_range(0,3))
      elif noise_val<-0.1:
        $TileMap.set_cell(0,Vector2i(x,y),0,Vector2i(2,0),randi_range(0,3))
      elif noise_val<0:
        $TileMap.set_cell(0,Vector2i(x,y),0,Vector2i(3,0),randi_range(0,3))
      elif noise_val<0.1:
        $TileMap.set_cell(0,Vector2i(x,y),0,Vector2i(0,1),randi_range(0,3))
      elif noise_val<0.2:
        $TileMap.set_cell(0,Vector2i(x,y),0,Vector2i(1,1),randi_range(0,3))
      elif noise_val<0.3:
        $TileMap.set_cell(0,Vector2i(x,y),0,Vector2i(2,1),randi_range(0,3))
      else:
        $TileMap.set_cell(0,Vector2i(x,y),0,Vector2i(3,1),randi_range(0,3))
