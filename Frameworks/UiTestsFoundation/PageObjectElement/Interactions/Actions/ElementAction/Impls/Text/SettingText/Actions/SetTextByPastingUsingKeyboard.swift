import MixboxTestsFoundation

public final class SetTextByPastingUsingKeyboard: ElementInteraction {
    private let text: String
    private let textEditingActionMode: TextEditingActionMode
    
    public init(
        text: String,
        textEditingActionMode: TextEditingActionMode)
    {
        self.text = text
        self.textEditingActionMode = textEditingActionMode
    }
    
    public func with(
        dependencies: ElementInteractionDependencies)
        -> ElementInteractionWithDependencies
    {
        return WithDependencies(
            dependencies: dependencies,
            text: text,
            textEditingActionMode: textEditingActionMode
        )
    }
    
    public final class WithDependencies: ElementInteractionWithDependencies {
        private let dependencies: ElementInteractionDependencies
        private let text: String
        private let textEditingActionMode: TextEditingActionMode
        
        public init(
            dependencies: ElementInteractionDependencies,
            text: String,
            textEditingActionMode: TextEditingActionMode)
        {
            self.dependencies = dependencies
            self.text = text
            self.textEditingActionMode = textEditingActionMode
        }
    
        public func description() -> String {
            let keyToReplaceSelection = text.isEmpty ? "Delete" : "⌘V"
            return """
                заменить текст элемента "\(dependencies.elementInfo.elementName)" на "\(text)" с помощью ⌘A + \(keyToReplaceSelection)
                """
        }
        
        public func interactionFailureShouldStopTest() -> Bool {
            return true
        }
        
        public func perform() -> InteractionResult {
            dependencies.retriableTimedInteractionState.markAsImpossibleToRetry()
            
            dependencies.pasteboard.string = text
            
            switch textEditingActionMode {
            case .replace:
                if text.isEmpty {
                    dependencies.keyboardEventInjector.inject { press in
                        press.command(press.a()) + press.backspace()
                    }
                } else {
                    dependencies.keyboardEventInjector.inject { press in
                        press.command(press.a() + press.v())
                    }
                }
            case .append:
                if !text.isEmpty {
                    dependencies.keyboardEventInjector.inject { press in
                        press.command(press.v())
                    }
                }
            }
            
            return .success
        }
    }
}
