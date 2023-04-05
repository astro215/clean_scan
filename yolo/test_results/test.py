from ultralytics import YOLO

model = YOLO("best.pt")

model.predict(source = "images" , show = True , save=True ,hide_conf =False , conf= 0.5 , save_txt = True ,save_crop=False,line_thickness=3)
