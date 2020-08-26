classdef entry < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        MortgageCalculatorUIFigure  matlab.ui.Figure
        GridLayout                  matlab.ui.container.GridLayout
        LeftPanel                   matlab.ui.container.Panel
        EditFieldLabel              matlab.ui.control.Label
        EditField                   matlab.ui.control.NumericEditField
        EditField_2Label            matlab.ui.control.Label
        EditField_2                 matlab.ui.control.NumericEditField
        EditField_3Label            matlab.ui.control.Label
        EditField_3                 matlab.ui.control.NumericEditField
        Button                      matlab.ui.control.Button
        MonthlyPaymentEditField     matlab.ui.control.NumericEditField
        Label                       matlab.ui.control.Label
        TextArea                    matlab.ui.control.TextArea
        RightPanel                  matlab.ui.container.Panel
        PrincipalInterestUIAxes     matlab.ui.control.UIAxes
    end

    % Properties that correspond to apps with auto-reflow
    properties (Access = private)
        onePanelWidth = 576;
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Changes arrangement of the app based on UIFigure width
        function updateAppLayout(app, event)
            currentFigureWidth = app.MortgageCalculatorUIFigure.Position(3);
            if(currentFigureWidth <= app.onePanelWidth)
                % Change to a 2x1 grid
                app.GridLayout.RowHeight = {316, 316};
                app.GridLayout.ColumnWidth = {'1x'};
                app.RightPanel.Layout.Row = 2;
                app.RightPanel.Layout.Column = 1;
            else
                % Change to a 1x2 grid
                app.GridLayout.RowHeight = {'1x'};
                app.GridLayout.ColumnWidth = {257, '1x'};
                app.RightPanel.Layout.Row = 1;
                app.RightPanel.Layout.Column = 2;
            end
        end

        % Button pushed function: Button
        function ButtonPushed(app, event)
                       
            % 执行鱼群算法
            num = app.EditField.Value ;
            it = app.EditField_2.Value ;
            see = app.EditField_3 .Value;
            [b_route,b_value] = Fish(num,it,see);
            app.MonthlyPaymentEditField.Value = b_value(it);
            app.TextArea.Value = num2str(b_route);
            
            x_axes = 1:1:it;
            plot(app.PrincipalInterestUIAxes,x_axes,b_value,'k');
            grid on;
            title('优化曲线');
            xlabel('迭代次数');
            ylabel('优化函数值');
            
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create MortgageCalculatorUIFigure and hide until all components are created
            app.MortgageCalculatorUIFigure = uifigure('Visible', 'off');
            app.MortgageCalculatorUIFigure.AutoResizeChildren = 'off';
            app.MortgageCalculatorUIFigure.Position = [100 100 653 316];
            app.MortgageCalculatorUIFigure.Name = 'Fish_try';
            app.MortgageCalculatorUIFigure.SizeChangedFcn = createCallbackFcn(app, @updateAppLayout, true);

            % Create GridLayout
            app.GridLayout = uigridlayout(app.MortgageCalculatorUIFigure);
            app.GridLayout.ColumnWidth = {357, '1x'};
            app.GridLayout.RowHeight = {'1x'};
            app.GridLayout.ColumnSpacing = 0;
            app.GridLayout.RowSpacing = 0;
            app.GridLayout.Padding = [0 0 0 0];
            app.GridLayout.Scrollable = 'on';

            % Create LeftPanel
            app.LeftPanel = uipanel(app.GridLayout);
            app.LeftPanel.Layout.Row = 1;
            app.LeftPanel.Layout.Column = 1;
            app.LeftPanel.Scrollable = 'on';

            % Create EditFieldLabel
            app.EditFieldLabel = uilabel(app.LeftPanel);
            app.EditFieldLabel.HorizontalAlignment = 'right';
            app.EditFieldLabel.Position = [58 256 53 22];
            app.EditFieldLabel.Text = 'numOfFishes';

            % Create EditField
            app.EditField = uieditfield(app.LeftPanel, 'numeric');
            app.EditField.Limits = [1 1000];
            app.EditField.ValueDisplayFormat = '%8.f';
            app.EditField.Position = [126 256 100 22];
            app.EditField.Value = 10;

            % Create EditField_2Label
            app.EditField_2Label = uilabel(app.LeftPanel);
            app.EditField_2Label.HorizontalAlignment = 'right';
            app.EditField_2Label.Position = [58 203 53 22];
            app.EditField_2Label.Text = 'iteration';

            % Create EditField_2
            app.EditField_2 = uieditfield(app.LeftPanel, 'numeric');
            app.EditField_2.Limits = [1 100000];
            app.EditField_2.Position = [126 203 100 22];
            app.EditField_2.Value = 30;

            % Create EditField_3Label
            app.EditField_3Label = uilabel(app.LeftPanel);
            app.EditField_3Label.HorizontalAlignment = 'right';
            app.EditField_3Label.Position = [1 150 112 22];
            app.EditField_3Label.Text = 'fishcansee';

            % Create EditField_3
            app.EditField_3 = uieditfield(app.LeftPanel, 'numeric');
            app.EditField_3.Limits = [1 341];
            app.EditField_3.ValueDisplayFormat = '%.0f';
            app.EditField_3.Position = [126 150 100 22];
            app.EditField_3.Value = 100;

            % Create Button
            app.Button = uibutton(app.LeftPanel, 'push');
            app.Button.ButtonPushedFcn = createCallbackFcn(app, @ButtonPushed, true);
            app.Button.Position = [23 85 100 25];
            app.Button.Text = 'start';

            % Create MonthlyPaymentEditField
            app.MonthlyPaymentEditField = uieditfield(app.LeftPanel, 'numeric');
            app.MonthlyPaymentEditField.ValueDisplayFormat = '%7.2f';
            app.MonthlyPaymentEditField.Editable = 'off';
            app.MonthlyPaymentEditField.Position = [142 88 100 22];
            app.MonthlyPaymentEditField.Value = Inf;


            % Create TextArea
            app.TextArea = uitextarea(app.LeftPanel);
            app.TextArea.Position = [25 9 190 60];
            

            % Create RightPanel
            app.RightPanel = uipanel(app.GridLayout);
            app.RightPanel.Layout.Row = 1;
            app.RightPanel.Layout.Column = 2;
            app.RightPanel.Scrollable = 'on';

            % Create PrincipalInterestUIAxes
            app.PrincipalInterestUIAxes = uiaxes(app.RightPanel);
            title(app.PrincipalInterestUIAxes, '')
            xlabel(app.PrincipalInterestUIAxes, 'iter')
            ylabel(app.PrincipalInterestUIAxes, 'value')
            app.PrincipalInterestUIAxes.Position = [30 36 326 250];

            % Show the figure after all components are created
            app.MortgageCalculatorUIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = entry

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.MortgageCalculatorUIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)
            % Delete UIFigure when app is deleted
            delete(app.MortgageCalculatorUIFigure)
        end
    end
end