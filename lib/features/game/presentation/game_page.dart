import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'game_controller.dart';

class GamePage extends StatelessWidget {
  final GameController c = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Level ${c.level}'),
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: c.askExit,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.lightbulb),
            onPressed: c.showHint,
            tooltip: 'hint'.tr,
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: 12),
              GetBuilder<GameController>(
                id: 'timer',
                builder: (_) => Text(
                  '${'time_taken'.tr}${_.seconds}s',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(height: 12),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GetBuilder<GameController>(
                    id: 'board',
                    builder: (_) => GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 81,
                      gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 9),
                      itemBuilder: (_, index) {
                        final r = index ~/ 9;
                        final x = index % 9;
                        final val = c.board[r][x];
                        final original = c.original[r][x] != null;
                        final selected = c.selectedRow == r && c.selectedCol == x;

                        return GestureDetector(
                          onTap: () => c.selectCell(r, x),
                          child: Container(
                            margin: EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              color: selected
                                  ? Colors.blue[100]
                                  : original
                                  ? Colors.grey[300]
                                  : Colors.white,
                              border: Border.all(color: Colors.black12),
                            ),
                            child: Center(
                              child: Text(
                                val?.toString() ?? '',
                                style: TextStyle(
                                  fontWeight:
                                  original ? FontWeight.bold : FontWeight.normal,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Wrap(
                  spacing: 4,
                  children: List.generate(
                    9,
                        (i) => ElevatedButton(
                      onPressed: () => c.inputNumber(i + 1),
                      child: Text('${i + 1}'),
                    ),
                  ),
                ),
              ),
            ],
          ),
          GetBuilder<GameController>(
            id: 'success',
            builder: (_) => _.showSuccessAnim
                ? Center(
              child: ScaleTransition(
                scale: _.animController,
                child: Icon(Icons.check_circle, size: 100, color: Colors.green),
              ),
            )
                : SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
