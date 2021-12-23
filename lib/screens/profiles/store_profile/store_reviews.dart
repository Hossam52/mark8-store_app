import 'package:common_widgets/accuracy_good_bad.dart';
import 'package:store_app/general_commponent/components.dart';
import 'package:store_app/models/driver_model.dart';
import 'package:store_app/models/review_model.dart';
import 'package:store_app/presentation/resourses/color_manager.dart';
import 'package:store_app/presentation/resourses/styles_manager.dart';
// import 'package:store_app/widgets/card_widget.dart';
// import 'package:store_app/widgets/rating_bars.dart';
// import 'package:store_app/widgets/rating_row.dart';
import 'package:common_widgets/card_widget.dart';
import 'package:common_widgets/rating_bars.dart';
import 'package:common_widgets/rating_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class StoreReviews extends StatelessWidget {
  StoreReviews({Key? key, required this.driverReviewModel})
      : _speedBehavior = driverReviewModel.speed,
        _commitmentBehavior = driverReviewModel.commitment,
        _communicationBehavior = driverReviewModel.communication,
        super(key: key);
  final DriverReviewModel driverReviewModel;
  final SpeedBehavior _speedBehavior;
  final CommunicationBehavior _communicationBehavior;
  final CommitmentBehavior _commitmentBehavior;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Rate Store',
                  style: getRegularStyle(color: ColorManager.lightGrey))),
          _starsAndRate(context),
          _ratingBars(context),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(
              thickness: 1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Rate products',
                style: getRegularStyle(color: ColorManager.lightGrey)),
          ),
          SizedBox(
              width: width * 0.45,
              child: AccuracyGoodBad(
                goodValue: 30,
                badValue: 70,
              )),
          _products(),
          _statistics(),
        ],
      ),
    );
  }

  Widget _starsAndRate(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RatingRow(),
        SizedBox(width: 10),
        Text('(${driverReviewModel.reviews}) review'),
      ],
    );
  }

  Widget _ratingBars(BuildContext context) {
    return CustomRatingBars(
      driverReviewModel.ratingValues[0],
      driverReviewModel.ratingValues[1],
      driverReviewModel.ratingValues[2],
      driverReviewModel.ratingValues[3],
      driverReviewModel.ratingValues[4],
    );
  }

  Widget _products() {
    return Builder(builder: (context) {
      final height = MediaQuery.of(context).size.height;
      return SizedBox(
        height: height * 0.2,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            _ProductItem(),
            _ProductItem(),
            _ProductItem(),
            _ProductItem(),
          ],
        ),
      );
    });
  }

  Widget _statistics() {
    return Container(
      height: 40,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
          border: Border.all(color: ColorManager.lightGrey),
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Better sales ${driverReviewModel.betterDriver}',
            style: getRegularStyle(),
          ),
          VerticalDivider(thickness: 1),
          Text(
            'Points ${driverReviewModel.points}',
            style: getRegularStyle(),
          ),
        ],
      ),
    );
  }
}

class _ProductItem extends StatelessWidget {
  const _ProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return CardWidget(
        width: width * 0.32,
        imagePath: 'asset/images/starbucks.png',
        title: 'Product name',
        bottom: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: FittedBox(
                child: Text('30% good',
                    style: getBoldStyle(fontSize: 16, color: Colors.green)),
              ),
            ),
            SizedBox(width: 5),
            Expanded(
              child: FittedBox(
                child: Text(
                  '70% bad',
                  style: getBoldStyle(fontSize: 16, color: Colors.red),
                ),
              ),
            )
          ],
        ));
  }
}
