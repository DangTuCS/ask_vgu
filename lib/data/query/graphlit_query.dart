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

  static const String getMessages = r'''
    query Conversation($conversationId: ID!) {
      conversation(id: $conversationId) {
        messages {
          message
          role
        }
      }
    }
  ''';

  static const String deleteConversation = r'''
    mutation DeleteConversation($id: ID!) {
      deleteConversation(id: $id) {
        id
        state
      }
    }
  ''';
}