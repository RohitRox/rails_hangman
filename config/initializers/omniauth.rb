Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, 481004221939222, "e4ecf8c9374820b166804d130f245bcd"
  provider :twitter, "DhRNLEL4XKP9qF3TWMdRhg", "a85jsubSP1kDv3FiVbwLrfqRwogXlHbD71Lu49c9i0"
end