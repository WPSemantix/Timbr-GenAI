import streamlit as st
import os
import timbr_utils


# App title
st.title("GraphRAG with Timbr")

# Initialize session state for chat history
if "messages" not in st.session_state:
    st.session_state.messages = []

# Display chat history
for message in st.session_state.messages:
    with st.chat_message(message["role"]):
        st.write(message["content"])

# User input
user_input = st.chat_input("Ask something...")

# Handle user input
if user_input:
    # Add user message to chat history
    st.session_state.messages.append({"role": "user", "content": user_input})
    
    # Display user message
    with st.chat_message("user"):
        st.write(user_input)
    
    # Display assistant thinking indicator
    with st.chat_message("assistant"):
        message_placeholder = st.empty()
        message_placeholder.text("Thinking...")
        
        try:
            # Use timbr_utils.get_answer instead of direct OpenAI API call
            response = timbr_utils.get_answer(user_input)
            
            # Display the response
            message_placeholder.markdown(response)
            
            # Add assistant response to chat history
            st.session_state.messages.append({"role": "assistant", "content": response})
            
        except Exception as e:
            message_placeholder.error(f"Error: {str(e)}")