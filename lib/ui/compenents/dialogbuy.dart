// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:libraryapp/data/books.dart';
class dialogbuy extends StatefulWidget {
  int id;
   dialogbuy({super.key,required this.id});

  @override
  State<dialogbuy> createState() => _dialogbuyState();
}

class _dialogbuyState extends State<dialogbuy> {
  final List<String> items = [
  "Adrar",
  "Chlef",
  "Laghouat",
  "Oum El Bouaghi",
  "Batna",
  "Béjaïa",
  "Biskra",
  "Béchar",
  "Blida",
  "Bouira",
  "Tamanrasset",
  "Tébessa",
  "Tlemcen",
  "Tiaret",
  "Tizi Ouzou",
  "Algiers",
  "Djelfa",
  "Jijel",
  "Sétif",
  "Saïda",
  "Skikda",
  "Sidi Bel Abbès",
  "Annaba",
  "Guelma",
  "Constantine",
  "Médéa",
  "Mostaganem",
  "M'Sila",
  "Mascara",
  "Ouargla",
  "Oran",
  "El Bayadh",
  "Illizi",
  "Bordj Bou Arréridj",
  "Boumerdès",
  "El Tarf",
  "Tindouf",
  "Tissemsilt",
  "El Oued",
  "Khenchela",
  "Souk Ahras",
  "Tipaza",
  "Mila",
  "Aïn Defla",
  "Naâma",
  "Aïn Témouchent",
  "Ghardaïa",
  "Relizane",
  "Timimoun",
  "Bordj Badji Mokhtar",
  "Ouled Djellal",
  "Béni Abbès",
  "In Salah",
  "In Guezzam",
  "Touggourt",
  "Djanet",
  "El M'Ghair",
  "El Meniaa",
];
final text=TextEditingController();
String? selectedValue;
final numbercon=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
      title: Text('Entre your information'),
      content: SizedBox(
        height: 170,
        child: Column(
          children: [
            DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          isExpanded: true,
          hint: Text(
            'Select your wilaya',
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).hintColor,
            ),
          ),
          items: items
              .map((item) => DropdownMenuItem(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ))
              .toList(),
          value: selectedValue,
          onChanged: (value) {
            setState(() {
              selectedValue = value;
            });
          },
          buttonStyleData:  ButtonStyleData(
            padding: EdgeInsets.symmetric(horizontal: 16),
            height: 40,
            width: 300,
            decoration: BoxDecoration(border: Border.all(color:Colors.black ),borderRadius: BorderRadius.circular(20))
          ),
          dropdownStyleData: const DropdownStyleData(
            maxHeight: 200,
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
          ),
          dropdownSearchData: DropdownSearchData(
            searchController: text,
            searchInnerWidgetHeight: 50,
            searchInnerWidget: Container(
              height: 50,
              padding: const EdgeInsets.only(
                top: 8,
                bottom: 4,
                right: 8,
                left: 8,
              ),
              child: TextFormField(
                textCapitalization: TextCapitalization.characters,
                expands: true,
                maxLines: null,
                controller: text,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 8,
                  ),
                  hintText: 'Search for your wilaya ...',
                  hintStyle: const TextStyle(fontSize: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            searchMatchFn: (item, searchValue) {
              return item.value.toString().contains(searchValue);
            },
          ),
          onMenuStateChange: (isOpen) {
            if (!isOpen) {
              text.clear();
            }
          },
        ),
      ),
      SizedBox(height: 20,),
      SizedBox(
        height: 40,
        child: TextFormField(
          controller: numbercon,
          decoration: InputDecoration(contentPadding: EdgeInsets.only(left:10),border:OutlineInputBorder(borderSide: BorderSide(color: Colors.black),borderRadius: BorderRadius.circular(20),),hintText: 'Entre your number'),
        ),
      ),
      SizedBox(height: 20,),
      Row(
        children: [
          Expanded(child: GestureDetector(onTap: () {
                Navigator.pop(context);
              },child: SizedBox(height: 50,width: 100,child: Center(child: Text('No'),),))),
              Container(height: 50,width: 2,color: Colors.black12,),
              Expanded(child: GestureDetector(
                onTap: () async{
                  if (selectedValue!=null) {
                    if (int.tryParse(numbercon.text)!=null) {
                     var m= await buybook(widget.id, selectedValue!, int.parse(numbercon.text));
                      if (m.statusCode==200) {
                        Navigator.pop(context,true);
                      }
                    }
                  }
                },
                child: SizedBox(height: 50,width: 100,child: Center(child: Text('Buy',style: TextStyle(color: Colors.green),),),))),
            
        ],
      )      
              

            
          ],
        ),
      ),
    );
  }
}