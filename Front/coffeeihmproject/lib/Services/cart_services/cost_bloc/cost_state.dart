
abstract class CostState{
}

class TotalCostStateInit extends CostState {

}

class TotalCostState extends CostState {
  final Stream<double> totalCost;
  TotalCostState({
    required this.totalCost
  });
}