extends Node2D
@export var noise_text:NoiseTexture2D
@export var tile_size:Vector2i
var noise:Noise
<<<<<<< HEAD
var array:Array
var height:int
var width:int
func _ready():
  noise_text.noise.seed=randi()
  noise=noise_text.noise
  width=get_viewport_rect().size.x/(scale.x*tile_size.x)+1
  height=get_viewport_rect().size.y/(scale.y*tile_size.y)+1
  _generate()
=======
var height:int
var width:int

func _ready():
  noise_text.noise.seed=randi()
  noise=noise_text.noise
  width=get_viewport_rect().size.x/(4*tile_size.x)+1
  height=get_viewport_rect().size.y/(4*tile_size.y)+1
  _generate()
  print(width,height)

>>>>>>> 69d6e8c7964ff2c4c779434cf13cf95640042b17
func _generate():
  for x in range(width):
    for y in range(height):
      var noise_val:float = noise.get_noise_2d(x,y)
<<<<<<< HEAD
      array.append(noise_val)
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
  print(array.min())
  print(array.max())
=======
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
>>>>>>> 69d6e8c7964ff2c4c779434cf13cf95640042b17
