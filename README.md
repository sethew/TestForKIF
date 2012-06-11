TestForKIF
==========
illustrates a possible bug in KIF where UITableViews with scrollEnabled == NO cannot be 'tapped" more than once

Steps to reproduce:
1. Open the TestForKIF.xcworkspace
2. Run the "TestForKIF Integration" target and observe the second tableview tap not occurring and the scenario fails.
3. Open TFKViewController.m and change line 98 to enable scrolling.  Re-run the target and observe that both taps occur successfully and the scenario passes.
