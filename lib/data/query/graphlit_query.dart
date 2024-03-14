class GraphlitQuery {
  static const String postMessage = r'''
    mutation PromptConversation($prompt: String!, $id: ID) {
      promptConversation(prompt: $prompt, id: $id) {
        conversation {
          id
        }
        message {
          role
          author
          message
          tokens
          completionTime
        }
        messageCount
      }
    }
  ''';

  static const String getConversations = r'''
    query Results {
      conversations {
        results {
          id
          name
        }
      }
    }
  ''';
}