function saym --description "Lessac voice"
    echo $argv | \
        python -m piper \
        --model ~/.local/share/piper/models/en_US-lessac-medium.onnx \
        --output-raw | \
        aplay -r 22050 -f S16_LE -t raw - 2>/dev/null
end
