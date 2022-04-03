class SliderModel{

  String imagePath;
  String title;
  String desc;

  SliderModel({required this.desc, required this.title, required this.imagePath});
}

List<SliderModel> getSlides(){
  List<SliderModel> slides = <SliderModel>[];

  SliderModel sliderModel = new SliderModel(desc: "Don\'t know what to eat? Take a \npicture, we\'ll suggest things to \ncook with your ingredients.", title: "Get Inspired", imagePath: "assets/images/ebook.png");
  slides.add(sliderModel);
  
  sliderModel = new SliderModel(desc: "Find thousand of easy and \nhealthy recipes so you save \ntime and eat better.", title: "Easy & healthy", imagePath: "assets/images/learn.png");
  slides.add(sliderModel);
  
  sliderModel = new SliderModel(desc: "Save your favorite recipes and \nget reminded to buy the \ningredients to cook them.", title: "Save your favorites", imagePath: "assets/images/manthumbs.png");
  slides.add(sliderModel);

  return slides;

}



























