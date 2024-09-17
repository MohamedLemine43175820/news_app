import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:news_app/modules/web_view/web_view_screen.dart';


// Reusable components :
// 1. Timing
// 2. Refactor
// 3. Quality

// Material button

Widget defaultButton({

  double widthButton  = double.infinity,                  //width
  Color backgroundColorButton = Colors.blue,              // background

  double heightButton = 50.0,

  required VoidCallback onPressedButton,                       //function

  required String  textButton  ,                           //text

  bool isUpperCase = true,

  Color textButtonColor = Colors.white,

  double radius = 0,


}) => Container(
  width: widthButton,
  height: heightButton,

  // color:backgroundColorButton,

  decoration: BoxDecoration(

    borderRadius: BorderRadius.circular(radius),
    color:backgroundColorButton,
  ),



  child: MaterialButton(





    onPressed:onPressedButton,

    child :Text(


      isUpperCase ? textButton.toUpperCase() :textButton ,
      style: TextStyle(

        color: textButtonColor,
      ),

    ),
  ),
);


//  TextFormField

Widget defaultTextFormField({

  required TextEditingController controller,

  required TextInputType keyboardtype  ,



  // style: TextStyle() text input

  Color colorText = Colors.black,
  double  fontSize = 20.0,

  required String label ,

  //Widget border = OutlineInputBorder(),

  required IconData  prefixIcon  ,



  ValueChanged<String>? onFieldSubmitted,

  ValueChanged<String>? onChanged,

  required FormFieldValidator<String> validate,

  bool isPassword = false,

  IconData?  suffixIcon,

  VoidCallback? sufixPressed,

  GestureTapCallback? onTap,

  bool isClickable = true,



}) =>  TextFormField(



  controller : controller,


  style: TextStyle(

    color: colorText ,
    fontSize: fontSize,
    fontWeight :FontWeight.bold,

  ),


  keyboardType: keyboardtype,

  obscureText: isPassword,

  decoration: InputDecoration(


    labelText: label,

    border: OutlineInputBorder(),


    // icon email

    prefixIcon :Icon(prefixIcon,),

    suffixIcon: suffixIcon != null ? IconButton(
        onPressed: sufixPressed,

        icon: Icon(suffixIcon)

    ) : null,),


  onFieldSubmitted:onFieldSubmitted,

  onChanged: onChanged,

  validator: validate,

  onTap: onTap,
  enabled: isClickable,







);


Widget buildArticleItems(Map article , context ) => InkWell(

  onTap: (){

    navigateTo(context, WebViewScreen(
       url: article['url']));
  },
  child: Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(

      children: [

        Container(

          height: 120,
          width: 120,
          decoration: BoxDecoration(

            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(image: NetworkImage('${article['image_url']}'),
              fit: BoxFit.cover,

            ),
          ),
        ),

        SizedBox(width: 20,),

        Expanded(
          child: Container(
            height: 120,
            child: Column(
              //mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Expanded(
                  child: Text(
                    '${article['title']}',
                    style: Theme.of(context).textTheme.bodyLarge,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  '${article['pubDate']}',
                  style: TextStyle(
                    color: Colors.grey,

                  ),
                ),


              ],
            ),
          ),
        ),
      ],
    ),
  ),
);



Widget myDivider() => Padding(
  padding: const EdgeInsetsDirectional.only(start: 20),
  child: Container(

    width: double.infinity,
    height: 1,
    color: Colors.grey[300],
  ),
) ;



Widget articleBuilder(list , context) => ConditionalBuilder(

  condition: list.length > 0,
  builder: (context) =>
      ListView.separated(
        physics:  BouncingScrollPhysics(),

        itemBuilder: (BuildContext context, int index) => buildArticleItems(list[index], context) ,
        separatorBuilder: (BuildContext context, int index) => myDivider(),
        itemCount: list.length,

      ),

  fallback: (context) => Center(child: CircularProgressIndicator()),
);


void  navigateTo(context , Widget) => Navigator.push(

    context, 
  
   MaterialPageRoute(

       builder: (context) => Widget
),
);

