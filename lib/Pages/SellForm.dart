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
  String electricButton;
  String houseButton;
  String clothButton;
  String entertainmentButton;
  String petsButton;
  String drugButton;
  String vehicleButton;
  String engineButton;
  String serviceButton;
  String qualityButton;
  String paymentButton;
  String alternativeButton;
  String negotiationButton;
  String statusButton;
  String purposeButton;
  String newOldButton;
  String goodsStatusButton;
  String constructionButton;
  String whatToServeButton;
  String vaccinatedButton;
  String petSexButton;
  String petAge;

  List<DropdownMenuItem<String>> _buildDropDownMenuItems(
      List<String> listItems) {
    return listItems
        .map((String value) => DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            ))
        .toList();
  }

  Widget _buildButton(String hint, List<String> list) {
    if (widget.categoryName == "Free Area") {
      if (hint == "Sell/Rent") {
        return DropdownButton(
          isExpanded: true,
          hint: Text(hint),
          value: alternativeButton,
          underline: Container(),
          items: _buildDropDownMenuItems(list),
          onChanged: (String value) {
            setState(() {
              alternativeButton = value;
              hint = value;
            });
          },
        );
      } else {
        return DropdownButton(
          isExpanded: true,
          hint: Text(hint),
          value: negotiationButton,
          underline: Container(),
          items: _buildDropDownMenuItems(list),
          onChanged: (String value) {
            setState(() {
              negotiationButton = value;
              hint = value;
            });
          },
        );
      }
    } else if (widget.categoryName == "Condominium" ||
        widget.categoryName == "Sell") {
      return DropdownButton(
        isExpanded: true,
        hint: Text(hint),
        value: statusButton,
        underline: Container(),
        items: _buildDropDownMenuItems(list),
        onChanged: (String value) {
          setState(() {
            statusButton = value;
            hint = value;
          });
        },
      );
    } else if (widget.categoryName == "Rent") {
      return DropdownButton(
        isExpanded: true,
        hint: Text(hint),
        value: negotiationButton,
        underline: Container(),
        items: _buildDropDownMenuItems(list),
        onChanged: (String value) {
          setState(() {
            negotiationButton = value;
            hint = value;
          });
        },
      );
    } else if (widget.categoryName == "Hall") {
      return DropdownButton(
        isExpanded: true,
        hint: Text(hint),
        value: purposeButton,
        underline: Container(),
        items: _buildDropDownMenuItems(list),
        onChanged: (String value) {
          setState(() {
            purposeButton = value;
            hint = value;
          });
        },
      );
    } else if (widget.categoryName == "Store") {
      if (hint == "Negotiation") {
        return DropdownButton(
          isExpanded: true,
          hint: Text(hint),
          value: negotiationButton,
          underline: Container(),
          items: _buildDropDownMenuItems(list),
          onChanged: (String value) {
            setState(() {
              negotiationButton = value;
              hint = value;
            });
          },
        );
      } else {
        return DropdownButton(
          isExpanded: true,
          hint: Text(hint),
          value: serviceButton,
          underline: Container(),
          items: _buildDropDownMenuItems(list),
          onChanged: (String value) {
            setState(() {
              serviceButton = value;
              hint = value;
            });
          },
        );
      }
    } else if (widget.categoryName == "Vehicle") {
      if (hint == "Vehicle Type") {
        return DropdownButton(
          isExpanded: true,
          hint: Text(hint),
          value: vehicleButton,
          underline: Container(),
          items: _buildDropDownMenuItems(list),
          onChanged: (String value) {
            setState(() {
              vehicleButton = value;
              hint = value;
            });
          },
        );
      } else if (hint == "Engine Status") {
        return DropdownButton(
          isExpanded: true,
          hint: Text(hint),
          value: engineButton,
          underline: Container(),
          items: _buildDropDownMenuItems(list),
          onChanged: (String value) {
            setState(() {
              engineButton = value;
              hint = value;
            });
          },
        );
      } else {
        return DropdownButton(
          isExpanded: true,
          hint: Text(hint),
          value: newOldButton,
          underline: Container(),
          items: _buildDropDownMenuItems(list),
          onChanged: (String value) {
            setState(() {
              newOldButton = value;
              hint = value;
            });
          },
        );
      }
    } else if (widget.categoryName == "Electronics") {
      return DropdownButton(
        isExpanded: true,
        hint: Text(hint),
        value: electricButton,
        underline: Container(),
        items: _buildDropDownMenuItems(list),
        onChanged: (String value) {
          setState(() {
            electricButton = value;
            hint = value;
          });
        },
      );
    } else if (widget.categoryName == "Office and House Holds") {
      if (hint == "Status") {
        return DropdownButton(
          isExpanded: true,
          hint: Text(hint),
          value: goodsStatusButton,
          underline: Container(),
          items: _buildDropDownMenuItems(list),
          onChanged: (String value) {
            setState(() {
              goodsStatusButton = value;
              hint = value;
            });
          },
        );
      } else {
        return DropdownButton(
          isExpanded: true,
          hint: Text(hint),
          value: negotiationButton,
          underline: Container(),
          items: _buildDropDownMenuItems(list),
          onChanged: (String value) {
            setState(() {
              negotiationButton = value;
              hint = value;
            });
          },
        );
      }
    } else if (widget.categoryName == "Clothes and Jewelery") {
      if (hint == "What to post?") {
        return DropdownButton(
          isExpanded: true,
          hint: Text(hint),
          value: clothButton,
          underline: Container(),
          items: _buildDropDownMenuItems(list),
          onChanged: (String value) {
            setState(() {
              clothButton = value;
              hint = value;
            });
          },
        );
      } else {
        return DropdownButton(
          isExpanded: true,
          hint: Text(hint),
          value: negotiationButton,
          underline: Container(),
          items: _buildDropDownMenuItems(list),
          onChanged: (String value) {
            setState(() {
              negotiationButton = value;
              hint = value;
            });
          },
        );
      }
    } else if (widget.categoryName == "Construction Materials") {
      if (hint == "What to post?") {
        return DropdownButton(
          isExpanded: true,
          hint: Text(hint),
          value: constructionButton,
          underline: Container(),
          items: _buildDropDownMenuItems(list),
          onChanged: (String value) {
            setState(() {
              constructionButton = value;
              hint = value;
            });
          },
        );
      } else {
        return DropdownButton(
          isExpanded: true,
          hint: Text(hint),
          value: negotiationButton,
          underline: Container(),
          items: _buildDropDownMenuItems(list),
          onChanged: (String value) {
            setState(() {
              negotiationButton = value;
              hint = value;
            });
          },
        );
      }
    } else if (widget.categoryName == "Food and Beverage") {
      if (hint == "Services Provided") {
        return DropdownButton(
          isExpanded: true,
          hint: Text(hint),
          value: serviceButton,
          underline: Container(),
          items: _buildDropDownMenuItems(list),
          onChanged: (String value) {
            setState(() {
              serviceButton = value;
              hint = value;
            });
          },
        );
      } else if (hint == "Quantity") {
        return DropdownButton(
          isExpanded: true,
          hint: Text(hint),
          value: qualityButton,
          underline: Container(),
          items: _buildDropDownMenuItems(list),
          onChanged: (String value) {
            setState(() {
              qualityButton = value;
              hint = value;
            });
          },
        );
      } else {
        return DropdownButton(
          isExpanded: true,
          hint: Text(hint),
          value: paymentButton,
          underline: Container(),
          items: _buildDropDownMenuItems(list),
          onChanged: (String value) {
            setState(() {
              paymentButton = value;
              hint = value;
            });
          },
        );
      }
    } else if (widget.categoryName == "Pets") {
      if (hint == "Pet Type") {
        return DropdownButton(
          isExpanded: true,
          hint: Text(hint),
          value: petsButton,
          underline: Container(),
          items: _buildDropDownMenuItems(list),
          onChanged: (String value) {
            setState(() {
              petsButton = value;
              hint = value;
            });
          },
        );
      } else if (hint == "Vaccinated?") {
        return DropdownButton(
          isExpanded: true,
          hint: Text(hint),
          value: vaccinatedButton,
          underline: Container(),
          items: _buildDropDownMenuItems(list),
          onChanged: (String value) {
            setState(() {
              vaccinatedButton = value;
              hint = value;
            });
          },
        );
      } else if (hint == "Sex") {
        return DropdownButton(
          isExpanded: true,
          hint: Text(hint),
          value: petSexButton,
          underline: Container(),
          items: _buildDropDownMenuItems(list),
          onChanged: (String value) {
            setState(() {
              petSexButton = value;
              hint = value;
            });
          },
        );
      } else if (hint == "Age Range") {
        return DropdownButton(
          isExpanded: true,
          hint: Text(hint),
          value: petAge,
          underline: Container(),
          items: _buildDropDownMenuItems(list),
          onChanged: (String value) {
            setState(() {
              petAge = value;
              hint = value;
            });
          },
        );
      } else {
        return DropdownButton(
          isExpanded: true,
          hint: Text(hint),
          value: negotiationButton,
          underline: Container(),
          items: _buildDropDownMenuItems(list),
          onChanged: (String value) {
            setState(() {
              negotiationButton = value;
              hint = value;
            });
          },
        );
      }
    } else if (widget.categoryName == "Entertainment Service") {
      return DropdownButton(
        isExpanded: true,
        hint: Text(hint),
        value: entertainmentButton,
        underline: Container(),
        items: _buildDropDownMenuItems(list),
        onChanged: (String value) {
          setState(() {
            entertainmentButton = value;
            hint = value;
          });
        },
      );
    } else if (widget.categoryName == "Drugs") {
      return DropdownButton(
        isExpanded: true,
        hint: Text(hint),
        value: drugButton,
        underline: Container(),
        items: _buildDropDownMenuItems(list),
        onChanged: (String value) {
          setState(() {
            drugButton = value;
            hint = value;
          });
        },
      );
    }

    return Container();
  }

  Widget _buildDropDownMenuButton(
    String hint,
    List<String> list,
  ) {
    return Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: _buildButton(hint, list));
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
            color: BrolineColor.brolineDarkBlue,
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
          _buildDropDownMenuButton("Sell/Rent", DropDownItemsList.alternative),
          _buildForm("Surface Area", Icons.landscape_outlined),
          _buildForm("Price", Icons.money),
          _buildDropDownMenuButton(
              "Fixed/Negotiable", DropDownItemsList.negotiation),
          _buildForm("Seller Name", Icons.person),
          _buildForm("Phone Number", Icons.phone_android),
        ],
      );
    } else if (widget.categoryName == "Sell" ||
        widget.categoryName == "Condominium") {
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
    } else if (widget.categoryName == "Rent") {
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
          _buildDropDownMenuButton(
              "Negotiation", DropDownItemsList.negotiation),
        ],
      );
    } else if (widget.categoryName == "Hall") {
      return ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          _buildForm("City", Icons.location_city_outlined),
          _buildForm("Sub City", Icons.house_outlined),
          _buildForm("Capacity", Icons.people_outline),
          _buildForm("Duration", Icons.access_time_outlined),
          _buildDropDownMenuButton("Service", DropDownItemsList.purpose),
          _buildForm("Price", Icons.money),
          _buildForm("Seller Name", Icons.person),
          _buildForm("Phone Number", Icons.phone_android),
        ],
      );
    } else if (widget.categoryName == "Store") {
      return ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          _buildForm("City", Icons.location_city_outlined),
          _buildForm("Sub City", Icons.house_outlined),
          _buildDropDownMenuButton("Service", DropDownItemsList.serviceType),
          _buildForm("Surface Area", Icons.landscape_outlined),
          _buildDropDownMenuButton(
              "Negotiation", DropDownItemsList.negotiation),
          _buildForm("Price", Icons.money),
          _buildForm("Seller Name", Icons.person),
          _buildForm("Phone Number", Icons.phone_android),
        ],
      );
    } else if (widget.categoryName == "Vehicle") {
      return ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          _buildForm("City", Icons.location_city_outlined),
          _buildForm("Sub City", Icons.house_outlined),
          _buildDropDownMenuButton(
              "Vehicle Type", DropDownItemsList.vehicleList),
          _buildForm("Model", Icons.car_rental),
          _buildDropDownMenuButton("New/Used", DropDownItemsList.newOld),
          _buildForm("Fabrication Year", Icons.timeline),
          _buildDropDownMenuButton(
              "Engine Status", DropDownItemsList.engineStatus),
          _buildForm("Color", Icons.color_lens_outlined),
          _buildForm("Price", Icons.money),
          _buildForm("Seller Name", Icons.person),
          _buildForm("Phone Number", Icons.phone_android),
        ],
      );
    } else if (widget.categoryName == "Electronics") {
      return ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          _buildForm("City", Icons.location_city_outlined),
          _buildForm("Sub City", Icons.house_outlined),
          _buildDropDownMenuButton(
              "Electronics", DropDownItemsList.electronicsList),
          _buildForm("Detail", Icons.description_outlined),
          _buildForm("Price", Icons.money),
          _buildForm("Seller Name", Icons.person),
          _buildForm("Phone Number", Icons.phone_android),
        ],
      );
    } else if (widget.categoryName == "Office and House Holds") {
      return ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          _buildForm("City", Icons.location_city_outlined),
          _buildForm("Sub City", Icons.house_outlined),
          _buildDropDownMenuButton("Status", DropDownItemsList.goodsStatus),
          _buildForm("Detail", Icons.description_outlined),
          _buildForm("Price", Icons.money),
          _buildDropDownMenuButton(
              "Negotiation", DropDownItemsList.negotiation),
          _buildForm("Seller Name", Icons.person),
          _buildForm("Phone Number", Icons.phone_android),
        ],
      );
    } else if (widget.categoryName == "Clothes and Jewelery") {
      return ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          _buildForm("City", Icons.location_city_outlined),
          _buildForm("Sub City", Icons.house_outlined),
          _buildDropDownMenuButton(
              "What to post?", DropDownItemsList.clothList),
          _buildForm("Detail", Icons.description_outlined),
          _buildForm("Price", Icons.money),
          _buildDropDownMenuButton(
              "Negotiation", DropDownItemsList.negotiation),
          _buildForm("Seller Name", Icons.person),
          _buildForm("Phone Number", Icons.phone_android),
        ],
      );
    } else if (widget.categoryName == "Construction Materials") {
      return ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          _buildForm("City", Icons.location_city_outlined),
          _buildForm("Sub City", Icons.house_outlined),
          _buildDropDownMenuButton(
              "What to post?", DropDownItemsList.clothList),
          _buildForm("Detail", Icons.description_outlined),
          _buildForm("Price", Icons.money),
          _buildDropDownMenuButton(
              "Negotiation", DropDownItemsList.negotiation),
          _buildForm("Seller Name", Icons.person),
          _buildForm("Phone Number", Icons.phone_android),
        ],
      );
    } else if (widget.categoryName == "Job") {
      return ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          _buildForm("City", Icons.location_city_outlined),
          _buildForm("Sub City", Icons.house_outlined),
          _buildForm("Company/Employer Name", Icons.person),
          _buildForm("Employer's Phone Number", Icons.phone_android),
          _buildForm("Description", Icons.description_outlined),
          _buildForm("Employee Criteria", Icons.list_alt_outlined),
          _buildForm("Contract Year", Icons.timeline),
          _buildForm("Salary", Icons.money),
        ],
      );
    } else if (widget.categoryName == "Food and Beverage") {
      return ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          _buildForm("City", Icons.location_city_outlined),
          _buildForm("Sub City", Icons.house_outlined),
          _buildForm("Service Providing Company Name", Icons.person),
          _buildDropDownMenuButton(
              "Services Provided", DropDownItemsList.serviceType),
          _buildDropDownMenuButton("Quantity", DropDownItemsList.quantity),
          _buildDropDownMenuButton(
              "Payment Method", DropDownItemsList.paymentMethod),
          _buildForm("Service Provider Phone Number", Icons.phone_android),
        ],
      );
    } else if (widget.categoryName == "Pets") {
      return ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          _buildForm("City", Icons.location_city_outlined),
          _buildForm("Sub City", Icons.house_outlined),
          _buildDropDownMenuButton("Pet Type", DropDownItemsList.petsList),
          _buildDropDownMenuButton("Vaccinated?", DropDownItemsList.vaccinated),
          _buildDropDownMenuButton("Sex", DropDownItemsList.petSex),
          _buildDropDownMenuButton("Age Range", DropDownItemsList.petAge),
          _buildForm("Description", Icons.description_outlined),
          _buildDropDownMenuButton(
              "Negotiation", DropDownItemsList.negotiation),
          _buildForm("Name", Icons.person),
          _buildForm("Phone Number", Icons.phone_android),
          _buildForm("Price", Icons.money),
        ],
      );
    } else if (widget.categoryName == "Entertainment Service") {
      return ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          _buildForm("City", Icons.location_city_outlined),
          _buildForm("Sub City", Icons.house_outlined),
          _buildDropDownMenuButton(
              "Entertainment Place", DropDownItemsList.entertainmentList),
          _buildForm("Services Provided", Icons.favorite_outline),
          _buildForm("Description", Icons.description_outlined),
          _buildForm("Phone Number", Icons.phone_android),
        ],
      );
    } else if (widget.categoryName == "Drugs") {
      return ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          _buildForm("City", Icons.location_city_outlined),
          _buildForm("Sub City", Icons.house_outlined),
          _buildDropDownMenuButton("Drug Category", DropDownItemsList.drugList),
          _buildForm("Pharmacy Name", Icons.local_pharmacy_outlined),
          _buildForm("Dosage", Icons.description),
          _buildForm("Description", Icons.description_outlined),
          _buildForm("Name", Icons.person),
          _buildForm("Phone Number", Icons.phone_android),
        ],
      );
    } else {
      return ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          _buildForm("City", Icons.location_city_outlined),
          _buildForm("Sub City", Icons.house_outlined),
          _buildForm("Description", Icons.description_outlined),
          _buildForm("Name", Icons.person),
          _buildForm("Phone Number", Icons.phone_android),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Post Ad"),
      backgroundColor: BrolineColor.brolineDarkBlue,),
      body: _buildFormList(),
    );
  }
}
