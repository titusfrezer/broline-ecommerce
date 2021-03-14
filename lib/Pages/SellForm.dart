import 'package:broline/Models/Colors.dart';
import 'package:broline/Models/DropDownItemsList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

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
  String houseTypeButton;
  String transmissionButton;
  String fuelTypeButton;
  String houseOfficeButton;
  String foodBeverageButton;

  List<Asset> images = <Asset>[];

  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 20,
      children: List.generate(images.length, (index) {
        Asset asset = images[index];
        return AssetThumb(

          asset: asset,
          width: 50,
          height: 50,
        );
      }),
    );
  }

  Future<void> loadAssets() async {
    List<Asset> resultList = <Asset>[];

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 3,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(
          takePhotoIcon: "chat",
        ),
        materialOptions: MaterialOptions(
          actionBarColor: "#0B4EA3",
          actionBarTitle: "Broline",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {}
    if (!mounted) return;

    setState(() {
      images = resultList;
    });
  }

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
    if (widget.categoryName == "Land") {
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
    } else if (widget.categoryName == "House") {
      if (hint == "Vila") {
        return DropdownButton(
          isExpanded: true,
          hint: Text(hint),
          value: houseTypeButton,
          underline: Container(),
          items: _buildDropDownMenuItems(list),
          onChanged: (String value) {
            setState(() {
              houseTypeButton = value;
              hint = value;
            });
          },
        );
      } else if (hint == "Rent/Sell") {
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
      } else if (hint == "Fixed/Negotiable") {
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
      }
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
      if (hint == "Fixed/Negotiable") {
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
      } else if (hint == "Rent/Sell") {
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
      } else if (hint == "Fuel Type") {
        return DropdownButton(
          isExpanded: true,
          hint: Text(hint),
          value: fuelTypeButton,
          underline: Container(),
          items: _buildDropDownMenuItems(list),
          onChanged: (String value) {
            setState(() {
              fuelTypeButton = value;
              hint = value;
            });
          },
        );
      } else if (hint == "Transmission") {
        return DropdownButton(
          isExpanded: true,
          hint: Text(hint),
          value: transmissionButton,
          underline: Container(),
          items: _buildDropDownMenuItems(list),
          onChanged: (String value) {
            setState(() {
              transmissionButton = value;
              hint = value;
            });
          },
        );
      } else if (hint == "Rent/Sell") {
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
      if (hint == "New/Used") {
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
      } else if (hint == "Fixed/Negotiable") {
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
      }
    } else if (widget.categoryName == "Office and House Holds") {
      if (hint == "New/Used") {
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
      } else if (hint == "House/Office") {
        return DropdownButton(
          isExpanded: true,
          hint: Text(hint),
          value: houseOfficeButton,
          underline: Container(),
          items: _buildDropDownMenuItems(list),
          onChanged: (String value) {
            setState(() {
              houseOfficeButton = value;
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
      } else if (hint == "Service Type") {
        return DropdownButton(
          isExpanded: true,
          hint: Text(hint),
          value: foodBeverageButton,
          underline: Container(),
          items: _buildDropDownMenuItems(list),
          onChanged: (String value) {
            setState(() {
              foodBeverageButton = value;
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
        color: BrolineColor.brolineLightGrey,
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

  Widget _buildDescriptionForm(String hintText) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 3),
      decoration: BoxDecoration(
        color: BrolineColor.brolineLightGrey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        maxLines: 5,
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 18),
        ),
      ),
    );
  }

  Widget _buildPickImage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        images.isEmpty ?  Container():Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            height: 100,
            child: buildGridView()),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),

            child: Container(
              width: 150,
              height: 50,
              margin: EdgeInsets.only(top: 10),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                color: BrolineColor.brolineDarkBlue,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Upload Photo",style: TextStyle(color: BrolineColor.brolineWhite),),
                    Icon(
                      Icons.camera_alt_outlined,
                      color: BrolineColor.brolineWhite,
                    ),
                  ],
                ),
                onPressed: loadAssets,
              ),
            ),
          ),

      ],
    );
  }

  Widget _buildFormList() {
    if (widget.categoryName == "Land") {
      return ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          _buildPickImage(),
          _buildForm("City", Icons.location_city_outlined),
          _buildForm("Sub City", Icons.house_outlined),
          _buildDropDownMenuButton("Sell/Rent", DropDownItemsList.alternative),
          _buildForm("Surface Area", Icons.landscape_outlined),
          _buildForm("Location", Icons.add_location_alt_outlined),
          _buildDescriptionForm("Description"),
          _buildForm("Actual Price", Icons.money),
          _buildForm("Discounted Price", Icons.payments_outlined),
          _buildDropDownMenuButton(
              "Fixed/Negotiable", DropDownItemsList.negotiation),
          _buildForm("Name", Icons.person),
          _buildForm("Phone Number", Icons.phone_android),
          _buildPostAddButton()
        ],
      );
    } else if (widget.categoryName == "House") {
      return ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          _buildPickImage(),
          _buildForm("City", Icons.location_city_outlined),
          _buildForm("Sub City", Icons.house_outlined),
          _buildDropDownMenuButton("Rent/Sell", DropDownItemsList.alternative),
          _buildForm("Surface Area", Icons.landscape_outlined),
          _buildDropDownMenuButton("Vila", DropDownItemsList.houseType),
          _buildForm("G+...", Icons.house_outlined),
          _buildForm("Rooms", Icons.room),
          _buildForm("Bed Rooms", Icons.king_bed),
          _buildForm("Bath Rooms", Icons.bathtub_outlined),
          _buildForm("Kitchens", Icons.kitchen_outlined),
          _buildForm("Location", Icons.add_location_alt_outlined),
          _buildDropDownMenuButton("Repair", DropDownItemsList.status),
          _buildDescriptionForm("Description"),
          _buildForm("Actual Price", Icons.money),
          _buildForm("Discounted Price", Icons.payments_outlined),
          _buildDropDownMenuButton(
              "Fixed/Negotiable", DropDownItemsList.negotiation),
          _buildForm("Name", Icons.person),
          _buildForm("Phone Number", Icons.phone_android),
          _buildPostAddButton()
        ],
      );
    } else if (widget.categoryName == "Hall") {
      return ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          _buildPickImage(),
          _buildForm("City", Icons.location_city_outlined),
          _buildForm("Sub City", Icons.house_outlined),
          _buildForm("Capacity", Icons.people_outline),
          _buildForm("Location", Icons.add_location_alt_outlined),
          _buildDropDownMenuButton("Service", DropDownItemsList.purpose),
          _buildDescriptionForm("Description"),
          _buildForm("Actual Price", Icons.money),
          _buildForm("Discounted Price", Icons.payments_outlined),
          _buildForm("Name", Icons.person),
          _buildForm("Phone Number", Icons.phone_android),
          _buildPostAddButton()
        ],
      );
    } else if (widget.categoryName == "Store") {
      return ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          _buildPickImage(),
          _buildForm("City", Icons.location_city_outlined),
          _buildForm("Sub City", Icons.house_outlined),
          _buildDropDownMenuButton("Service", DropDownItemsList.serviceType),
          _buildForm("Surface Area", Icons.landscape_outlined),
          _buildForm("Location", Icons.add_location_alt_outlined),
          _buildDropDownMenuButton(
              "Fixed/Negotiable", DropDownItemsList.negotiation),
          _buildDescriptionForm("Description"),
          _buildForm("Actual Price", Icons.money),
          _buildForm("Discounted Price", Icons.payments_outlined),
          _buildForm("Name", Icons.person),
          _buildForm("Phone Number", Icons.phone_android),
          _buildPostAddButton()
        ],
      );
    } else if (widget.categoryName == "Vehicle") {
      return ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          _buildPickImage(),
          _buildForm("City", Icons.location_city_outlined),
          _buildForm("Sub City", Icons.house_outlined),
          _buildDropDownMenuButton(
              "Vehicle Type", DropDownItemsList.vehicleList),
          _buildDropDownMenuButton("Rent/Sell", DropDownItemsList.alternative),
          _buildForm("Model", Icons.car_rental),
          _buildForm("Fabrication Year", Icons.timeline),
          _buildDropDownMenuButton(
              "Engine Status", DropDownItemsList.engineStatus),
          _buildDropDownMenuButton("New/Used", DropDownItemsList.newOld),
          _buildDropDownMenuButton(
              "Transmission", DropDownItemsList.transmission),
          _buildDropDownMenuButton("Fuel Type", DropDownItemsList.fuelType),
          _buildForm("Color", Icons.color_lens_outlined),
          _buildDescriptionForm("Description"),
          _buildForm("Actual Price", Icons.money),
          _buildForm("Discounted Price", Icons.payments_outlined),
          _buildForm("Name", Icons.person),
          _buildForm("Phone Number", Icons.phone_android),
          _buildPostAddButton()
        ],
      );
    } else if (widget.categoryName == "Electronics") {
      return ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          _buildPickImage(),
          _buildForm("City", Icons.location_city_outlined),
          _buildForm("Sub City", Icons.house_outlined),
          _buildDropDownMenuButton(
              "What to post?", DropDownItemsList.electronicsList),
          _buildDescriptionForm("Description"),
          _buildDropDownMenuButton("New/Used", DropDownItemsList.newOld),
          _buildForm("Actual Price", Icons.money),
          _buildForm("Discounted Price", Icons.payments_outlined),
          _buildDropDownMenuButton(
              "Fixed/Negotiable", DropDownItemsList.negotiation),
          _buildForm("Name", Icons.person),
          _buildForm("Phone Number", Icons.phone_android),
          _buildPostAddButton()
        ],
      );
    } else if (widget.categoryName == "Office and House Holds") {
      return ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          _buildPickImage(),
          _buildForm("City", Icons.location_city_outlined),
          _buildForm("Sub City", Icons.house_outlined),
          _buildDropDownMenuButton(
              "What to post?", DropDownItemsList.houseOffice),
          _buildDropDownMenuButton("New/Used", DropDownItemsList.goodsStatus),
          _buildDescriptionForm("Description"),
          _buildForm("Actual Price", Icons.money),
          _buildForm("Discounted Price", Icons.payments_outlined),
          _buildDropDownMenuButton(
              "Negotiable/Fixed", DropDownItemsList.negotiation),
          _buildForm("Name", Icons.person),
          _buildForm("Phone Number", Icons.phone_android),
          _buildPostAddButton()
        ],
      );
    } else if (widget.categoryName == "Clothes and Jewelery") {
      return ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          _buildPickImage(),
          _buildForm("City", Icons.location_city_outlined),
          _buildForm("Sub City", Icons.house_outlined),
          _buildDropDownMenuButton(
              "What to post?", DropDownItemsList.clothList),
          _buildDescriptionForm("Description"),
          _buildForm("Actual Price", Icons.money),
          _buildForm("Discounted Price", Icons.payments_outlined),
          _buildDropDownMenuButton(
              "Negotiable/Fixed", DropDownItemsList.negotiation),
          _buildForm("Name", Icons.person),
          _buildForm("Phone Number", Icons.phone_android),
          _buildPostAddButton()
        ],
      );
    } else if (widget.categoryName == "Construction Materials") {
      return ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          _buildPickImage(),
          _buildForm("City", Icons.location_city_outlined),
          _buildForm("Sub City", Icons.house_outlined),
          _buildDropDownMenuButton(
              "What to post?", DropDownItemsList.constructionList),
          _buildDescriptionForm("Description"),
          _buildForm("Actual Price", Icons.money),
          _buildForm("Discounted Price", Icons.payments_outlined),
          _buildDropDownMenuButton(
              "Negotiable/Fixed", DropDownItemsList.negotiation),
          _buildForm("Name", Icons.person),
          _buildForm("Phone Number", Icons.phone_android),
          _buildPostAddButton()
        ],
      );
    } else if (widget.categoryName == "Job") {
      return ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          _buildPickImage(),
          _buildForm("City", Icons.location_city_outlined),
          _buildForm("Sub City", Icons.house_outlined),
          _buildForm("Company/Employer Name", Icons.person),
          _buildForm("Employer's Phone Number", Icons.phone_android),
          _buildDescriptionForm(
            "Description",
          ),
          _buildForm("Employee Criteria", Icons.list_alt_outlined),
          _buildForm("Contract Year", Icons.timeline),
          _buildForm("Salary", Icons.money),
          _buildPostAddButton()
        ],
      );
    } else if (widget.categoryName == "Food and Beverage") {
      return ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          _buildPickImage(),
          _buildForm("City", Icons.location_city_outlined),
          _buildForm("Sub City", Icons.house_outlined),
          _buildForm("Service Providing Company Name", Icons.person),
          _buildDescriptionForm("Description"),
          _buildDropDownMenuButton(
              "Services Provided", DropDownItemsList.serviceType),
          _buildDropDownMenuButton("Quantity", DropDownItemsList.quantity),
          _buildDropDownMenuButton(
              "Service Type", DropDownItemsList.foodBeverage),
          _buildDropDownMenuButton(
              "Payment Method", DropDownItemsList.paymentMethod),
          _buildForm("Service Provider Phone Number", Icons.phone_android),
          _buildPostAddButton()
        ],
      );
    } else if (widget.categoryName == "Pets") {
      return ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          _buildPickImage(),
          _buildForm("City", Icons.location_city_outlined),
          _buildForm("Sub City", Icons.house_outlined),
          _buildDropDownMenuButton("Pet Type", DropDownItemsList.petsList),
          _buildDropDownMenuButton("Vaccinated?", DropDownItemsList.vaccinated),
          _buildDropDownMenuButton("Sex", DropDownItemsList.petSex),
          _buildDropDownMenuButton("Age Range", DropDownItemsList.petAge),
          _buildDescriptionForm("Description"),
          _buildDropDownMenuButton(
              "Negotiable/Fixed", DropDownItemsList.negotiation),
          _buildForm("Price", Icons.payments_outlined),
          _buildForm("Name", Icons.person),
          _buildForm("Phone Number", Icons.phone_android),
          _buildPostAddButton()
        ],
      );
    } else if (widget.categoryName == "Entertainment Service") {
      return ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          _buildPickImage(),
          _buildForm("City", Icons.location_city_outlined),
          _buildForm("Sub City", Icons.house_outlined),
          _buildDropDownMenuButton(
              "Entertainment Place", DropDownItemsList.entertainmentList),
          _buildForm("Services Provided", Icons.favorite_outline),
          _buildDescriptionForm(
            "Description",
          ),
          _buildForm("Contact Person Name", Icons.person),
          _buildForm("Phone Number", Icons.phone_android),
          _buildPostAddButton()
        ],
      );
    } else if (widget.categoryName == "Drugs") {
      return ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          _buildPickImage(),
          _buildForm("City", Icons.location_city_outlined),
          _buildForm("Sub City", Icons.house_outlined),
          _buildForm("Location", Icons.add_location_alt_outlined),
          _buildDropDownMenuButton("Drug Category", DropDownItemsList.drugList),
          _buildForm("Pharmacy Name", Icons.local_pharmacy_outlined),
          _buildForm("Dosage", Icons.description),
          _buildDescriptionForm(
            "Description",
          ),
          _buildForm("Name", Icons.person),
          _buildForm("Phone Number", Icons.phone_android),
          _buildPostAddButton()
        ],
      );
    } else {
      return ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          _buildPickImage(),
          _buildForm("City", Icons.location_city_outlined),
          _buildForm("Sub City", Icons.house_outlined),
          _buildDescriptionForm("Description"),
          _buildForm("Name", Icons.person),
          _buildForm("Phone Number", Icons.phone_android),
          _buildPostAddButton()
        ],
      );
    }
  }

  Widget _buildPostAddButton() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 50, horizontal: 75),
      child: RaisedButton(
        splashColor: BrolineColor.brolineBlack,
        padding: EdgeInsets.symmetric(
          vertical: 10,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        onPressed: () {},
        child: Text(
          "Post Ad",
          style: TextStyle(fontSize: 18),
        ),
        color: BrolineColor.brolineDarkBlue,
        textColor: BrolineColor.brolineWhite,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Ad"),
        backgroundColor: BrolineColor.brolineDarkBlue,
      ),
      body: _buildFormList(),
    );
  }
}
