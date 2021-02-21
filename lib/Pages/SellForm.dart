import 'package:broline/Models/Colors.dart';
import 'package:broline/Models/DropDownItemsList.dart';
import 'package:flutter/material.dart';

class SellForm extends StatefulWidget {
  final String categoryName;

  SellForm(this.categoryName);

  @override
  _SellFormState createState() => _SellFormState();
}

class _SellFormState extends State<SellForm> {
  String selectedButtonValue;

  List<DropdownMenuItem<String>> _buildDropDownMenuItems(
      List<String> listItems) {
    return listItems
        .map((String value) => DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            ))
        .toList();
  }

  Widget _buildDropDownMenuButton(String hint, List<String> list) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, ),

            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: DropdownButton(

        isExpanded: true,
        value: selectedButtonValue,
        hint: Text(hint),
        items: _buildDropDownMenuItems(list),
        onChanged: (String value) {
          setState(() {
            selectedButtonValue = value;
            hint = value;
          });
        },
      ),
    );
  }

  Widget _buildForm(String hintText, IconData icon) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 3),
      decoration: BoxDecoration(
        color: BrolineColor.brolineLightGrey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          icon: Icon(
            icon,
            color: BrolineColor.brolineDarkGrey,
          ),
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 18),
        ),
      ),
    );
  }

  Widget _buildFormList() {
    if (widget.categoryName == "Free Area") {
      return ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          _buildForm("City", Icons.location_city_outlined),
          _buildForm("Sub City", Icons.house_outlined),
          _buildDropDownMenuButton("Sell/Buy", DropDownItemsList.alternative),
          _buildForm("Surface Area", Icons.landscape_outlined),
          _buildForm("Price", Icons.money),
          _buildDropDownMenuButton("Fixed/ Negotiable", DropDownItemsList.negotiation),
          _buildForm("Seller Name", Icons.person),
          _buildForm("Phone Number", Icons.phone_android),
        ],
      );
    }else if(widget.categoryName == "Sell" ||widget.categoryName == "Condominium"){
      return ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          _buildForm("City", Icons.location_city_outlined),
          _buildForm("Sub City", Icons.house_outlined),
          _buildForm("Surface Area", Icons.landscape_outlined),
          _buildForm("Rooms", Icons.room),
          _buildForm("Bed Rooms", Icons.king_bed),
          _buildForm("Bath Rooms", Icons.bathtub_outlined),
          _buildForm("Kitchens", Icons.kitchen_outlined),
          _buildForm("Price", Icons.money),
          _buildDropDownMenuButton("Repair", DropDownItemsList.status),
          _buildForm("Seller Name", Icons.person),
          _buildForm("Phone Number", Icons.phone_android),
        ],
      );
    }else if(widget.categoryName == "Rent" ){
      return ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          _buildForm("City", Icons.location_city_outlined),
          _buildForm("Sub City", Icons.house_outlined),
          _buildForm("Surface Area", Icons.landscape_outlined),
          _buildForm("Rooms", Icons.room),
          _buildForm("Price", Icons.money),
          _buildForm("Seller Name", Icons.person),
          _buildForm("Phone Number", Icons.phone_android),
          _buildDropDownMenuButton("Negotiation", DropDownItemsList.negotiation),


        ],
      );
    }else if(widget.categoryName == "Hall"){
      return ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          _buildForm("City", Icons.location_city_outlined),
          _buildForm("Sub City", Icons.house_outlined),
          _buildForm("Capacity", Icons.people_outline),
          _buildDropDownMenuButton("Service", DropDownItemsList.purpose),
          _buildForm("Price", Icons.money),
          _buildForm("Seller Name", Icons.person),
          _buildForm("Phone Number", Icons.phone_android),
        ],
      );
    }else if(widget.categoryName == "Store"){
      return ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          _buildForm("City", Icons.location_city_outlined),
          _buildForm("Sub City", Icons.house_outlined),

          _buildDropDownMenuButton("Service", DropDownItemsList.serviceType),
          _buildForm("Surface Area", Icons.landscape_outlined),
          _buildDropDownMenuButton("Negotiation", DropDownItemsList.negotiation),
          _buildForm("Price", Icons.money),
          _buildForm("Seller Name", Icons.person),
          _buildForm("Phone Number", Icons.phone_android),
        ],
      );
    }else if(widget.categoryName == "Vehicle"){
      return ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          _buildForm("City", Icons.location_city_outlined),
          _buildForm("Sub City", Icons.house_outlined),

          _buildDropDownMenuButton("vehicle Type", DropDownItemsList.vehicleList),
          _buildForm("Model", Icons.car_rental),
          _buildForm("Fabrication Year", Icons.timeline),
          _buildForm("Color", Icons.color_lens_outlined),
          _buildDropDownMenuButton("Engine Status", DropDownItemsList.engineStatus),
          _buildDropDownMenuButton("New/Used", DropDownItemsList.engineStatus),
          _buildForm("Price", Icons.money),
          _buildForm("Seller Name", Icons.person),
          _buildForm("Phone Number", Icons.phone_android),
        ],
      );
    }
    return ListView(
      children: [
        SizedBox(
          height: 10,
        ),
        _buildForm("City", Icons.person),
        _buildForm("Sub City", Icons.person),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Post Ad")),
      body: _buildFormList(),
    );
  }
}
