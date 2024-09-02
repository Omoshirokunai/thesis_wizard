from flask import Flask, jsonify, request
from llama_cpp import Llama

app = Flask(__name__)

# Load the model from the models directory
model = Llama(model_path="model/gemma-2-9b.Q2_K.gguf", verbose=False)  # Adjust path as necessary

@app.route('/llama', methods=['POST'])
def handle_llama():
    data = request.json
    prompt = data.get('prompt', '')

    if prompt:
        response = model(prompt)
        print(response['choices'][0]['text'])
        return jsonify({'response': response['choices'][0]['text']})
    else:
        return jsonify({'error': 'No prompt provided'}), 400

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
