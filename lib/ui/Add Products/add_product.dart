import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobidthrift_seller_center/appbar/My_appbar.dart';
import 'package:mobidthrift_seller_center/ui/Orders.dart';
import 'package:ndialog/ndialog.dart';

import '../../constants/App_colors.dart';
import '../../constants/App_widgets.dart';
import '../../utils/utils.dart';

class AddProduct extends StatefulWidget {
  var productCollectionName;
  AddProduct({required this.productCollectionName, Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final _fireStore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance.currentUser;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _productSpecificationController =
      TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _startingBidController = TextEditingController();
  final TextEditingController _productPriceController = TextEditingController();
  final TextEditingController _shippingPriceController =
      TextEditingController();

  var _myFormKey = GlobalKey<FormState>();
  int? startingBid;
  int? productPrice;
  int? productShipping;
  bool ptaApproved = false;

  bool buttonEnable = false;
  bool imageUploaded = false;

  String? downloadImageUrl;
  File? pickedImage;
  bool showLocalImage = false;
  pickImageFrom(ImageSource fromGalleryOrCamera) async {
    XFile? file = await ImagePicker()
        .pickImage(source: fromGalleryOrCamera, imageQuality: 80);
    if (file == null) {
      return;
    }

    pickedImage = File(file.path);
    showLocalImage = true;
    setState(() {});
    ProgressDialog progressDialog = ProgressDialog(
      context,
      title: const Text('Uploading !!!'),
      message: const Text('Please wait'),
    );
    progressDialog.show();
    try {
      var fileName = DateTime.now().microsecondsSinceEpoch.toString() + '.jpg';
      UploadTask uploadTask = FirebaseStorage.instance
          .ref()
          .child('products_images')
          .child(fileName)
          .putFile(pickedImage!);
      TaskSnapshot snapshot = await uploadTask;
      downloadImageUrl = await snapshot.ref.getDownloadURL();
      print(downloadImageUrl);
      // _fireStore.collection(collectionPath).doc(_firebaseAuth.currentUser?.uid.toString()).update({
      //   'Profile_Image' : profileImageUrl,
      // });
      progressDialog.dismiss();
      Utils.flutterToast(' Image Uploaded ');
      imageUploaded = true;
    } catch (e) {
      progressDialog.dismiss();
      print(e.toString());
      Utils.flutterToast(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    var collectionName = widget.productCollectionName.toString();
    return Scaffold(
      appBar: MyAppbar().mySimpleAppBar(context, title: "Add Product Details"),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: _myFormKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Add Product Image'),
                  Center(
                    child: InkWell(
                      onTap: () {
                        bottomSheet(context);
                      },
                      child: Container(
                        height: 100,
                        width: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22),
                          border: Border.all(color: Colors.black),
                          // image: DecorationImage(image: pickedImage != null ? Image.file(pickedImage!).image : NetworkImage(''))
                        ),
                        child: Center(
                            child: Icon(
                          Icons.add_a_photo_outlined,
                          size: 33,
                        )),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AppWidgets().myTextFormField(
                      hintText: 'Enter a title',
                      labelText: 'Title',
                      controller: _titleController,
                      validator: (String? txt) {
                        if (txt == null || txt.isEmpty) {
                          return "Please provide the title";
                        }

                        return null;
                      },
                      fillColor: Colors.grey.shade300,
                      labelColor: Colors.black,
                      hintColor: Colors.black,
                      borderSideColor: Colors.black,
                      textColor: Colors.black),
                  SizedBox(
                    height: 10,
                  ),
                  AppWidgets().myTextFormField(
                      hintText: 'Enter a description',
                      labelText: 'Description',
                      controller: _descriptionController,
                      validator: (String? txt) {
                        if (txt == null || txt.isEmpty) {
                          return "Please provide description";
                        }

                        return null;
                      },
                      fillColor: Colors.grey.shade300,
                      labelColor: Colors.black,
                      hintColor: Colors.black,
                      borderSideColor: Colors.black,
                      textColor: Colors.black),
                  SizedBox(
                    height: 10,
                  ),
                  AppWidgets().myTextFormField(
                      validator: (String? txt) {
                        if (txt == null || txt.isEmpty) {
                          return "Please provide specifications";
                        }

                        return null;
                      },
                      hintText: 'Enter the specifications',
                      labelText: 'Specification',
                      controller: _productSpecificationController,
                      fillColor: Colors.grey.shade300,
                      labelColor: Colors.black,
                      hintColor: Colors.black,
                      borderSideColor: Colors.black,
                      textColor: Colors.black),
                  SizedBox(
                    height: 10,
                  ),
                  AppWidgets().myTextFormField(
                    hintText: 'Enter a starting bid price',
                    myType: TextInputType.numberWithOptions(),
                    labelText: 'Starting Bid',
                    controller: _startingBidController,
                    fillColor: Colors.grey.shade300,
                    labelColor: Colors.black,
                    hintColor: Colors.black,
                    borderSideColor: Colors.black,
                    textColor: Colors.black,
                    validator: (String? txt) {
                      if (txt == null || txt.isEmpty) {
                        return "Please provide bid price";
                      }

                      startingBid = int.parse(_startingBidController.text);
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AppWidgets().myTextFormField(
                    hintText: 'Enter total price',
                    myType: TextInputType.numberWithOptions(),
                    labelText: 'Total Price',
                    controller: _productPriceController,
                    fillColor: Colors.grey.shade300,
                    labelColor: Colors.black,
                    hintColor: Colors.black,
                    borderSideColor: Colors.black,
                    textColor: Colors.black,
                    validator: (String? txt) {
                      if (txt == null || txt.isEmpty) {
                        return "Please provide price";
                      }

                      productPrice = int.parse(_productPriceController.text);
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AppWidgets().myTextFormField(
                    hintText: 'Enter the shipping price',
                    myType: TextInputType.numberWithOptions(),
                    labelText: 'Shipping Price',
                    controller: _shippingPriceController,
                    fillColor: Colors.grey.shade300,
                    labelColor: Colors.black,
                    hintColor: Colors.black,
                    borderSideColor: Colors.black,
                    textColor: Colors.black,
                    validator: (String? txt) {
                      if (txt == null || txt.isEmpty) {
                        return "Please provide shipping price";
                      }

                      productShipping =
                          int.parse(_shippingPriceController.text);
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("PTA Approved"),
                      Switch(
                          value: ptaApproved,
                          onChanged: (bool) {
                            setState(() {
                              ptaApproved == false
                                  ? ptaApproved = true
                                  : ptaApproved = false;
                            });
                          }),
                      ptaApproved == true
                          ? Icon(
                              Icons.check,
                              color: Colors.green,
                            )
                          : Icon(
                              Icons.error_outline,
                              color: Colors.red,
                            ),
                      Text(ptaApproved == false ? 'No' : 'Yes'),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AppWidgets().myElevatedBTN(
                      onPressed: () {
                        print('' + _titleController.text);
                        if (imageUploaded == true) {
                          if (_myFormKey.currentState!.validate()) {
                            if (buttonEnable == false) {
                              ProgressDialog progressDialog = ProgressDialog(
                                context,
                                title: const Text('Uploading !!!'),
                                message: const Text('Please wait'),
                              );

                              setState(() {
                                progressDialog.show();
                              });
                              var docUid = DateTime.now()
                                  .microsecondsSinceEpoch
                                  .toString();
                              _fireStore
                                  .collection(collectionName)
                                  .doc(docUid)
                                  .set({
                                'productImage1': downloadImageUrl.toString(),
                                'productCollectionName': collectionName,
                                'productName': _titleController.text.toString(),
                                'productCurrentBid': startingBid,
                                'productDescription':
                                    _descriptionController.text.toString(),
                                'productSpecification':
                                    _productSpecificationController.text
                                        .toString(),
                                'productPTAApproved': ptaApproved,
                                'productPrice': productPrice,
                                'productShipping': productShipping,
                                'productUid': docUid.toString(),
                                'productShopkeeperUid': _auth!.uid.toString(),
                              }).then((value) {
                                setState(() {
                                  progressDialog.dismiss();
                                });
                                Utils.flutterToast('Product has been uploaded');
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Orders()));
                              }).onError((error, stackTrace) {
                                Utils.flutterToast(error.toString());
                                setState(() {
                                  progressDialog.dismiss();
                                });
                              });
                            } else {
                              Utils.flutterToast('Please wait');
                            }
                          }
                        } else {
                          Utils.flutterToast(
                              'Please add Image or wait to upload');
                        }
                      },
                      btnText: 'Submit',
                      btnColor: AppColors.myRedColor),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// bottom Sheet
  Future bottomSheet(context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: const Icon(Icons.camera_alt),
                  title: const Text('With Camera'),
                  onTap: () {
                    pickImageFrom(ImageSource.camera);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.storage),
                  title: const Text('From Gallery'),
                  onTap: () {
                    pickImageFrom(ImageSource.gallery);
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        });
  }
}
