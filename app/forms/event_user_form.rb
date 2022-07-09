class EventUserForm
  include ActiveModel::Model #バリデーションやレンダーを使えるようにする
  include ActiveRecord::AttributeAssignment #datetime_select用

  #使用したい属性を読み書きできるようにしてform_withの引数として利用する
  attr_accessor :name, :place, :content, :start_at, :end_at, :image, :remove_image, :user_information_id, :event_id, :owner_id

  #バリデーションの設定(モデルに記述したものと合わせる)
  with_options presence: true do
    validates :name, length: { maximum: 50 }
    validates :place, length: { maximum: 100 }
    validates :content, length: { maximum: 2000 }
    validates :start_at
    validates :end_at
    validates :user_information_id
  end


  #start_at、end_atのバリデーションエラー
  validate :start_at_shoulde_be_before_end_at

  #delegate :メソッド, to: :モデル名 /フォームのアクションのPOST,PATCHを自動で切り替える
  delegate :persisted?, to: :event

  # Formオブジェクトの値の初期化
  def initialize(attributes = nil, event: Event.new, event_user: EventUser.new)
    @event = event
    @event_user = event_user
    #attributesがnilだった場合、default_attributesを代入する
    attributes ||= default_attributes
    #ActiveModel::Modelのinitializeを呼び出して、書き込みメソッドで値を代入するため書き込みメソッドを定義する必要があった。
    super(attributes)
  end

  #ActiveRecordを継承していないため、saveメソッドを定義
  #transaction...SQL文の変更を、全部成功することを守るための存在。
  def save
    ActiveRecord::Base.transaction do
      event = Event.create(name: name, place: place, content: content, start_at: start_at, end_at: end_at, image: image)
      EventUser.create(event_id: event.id, user_information_id: user_information_id, owner_id: owner_id)
    end
    # rescue...例外処理、通常処理→例外発生時の処理
    rescue ActiveRecord::RecordInvalid
      false
  end

  def update_event
    ActiveRecord::Base.transaction do
      event.update(name: name, place: place, content: content, start_at: start_at, end_at: end_at, image: image)
      EventUser.where(event_id: event.id).update(user_information_id: user_information_id, owner_id: owner_id)
    end
    rescue ActiveRecord::RecordInvalid
      false
  end

  private

  attr_reader :event, :event_user

  def default_attributes
    {
      name: event.name,
      place: event.place,
      content: event.content,
      start_at: event.start_at,
      end_at: event.end_at,
      image: event.image,
      user_information_id: event_user.user_information_id,
      event_id: event_user.event_id,
      owner_id: event_user.owner_id
    }
  end

  def start_at_shoulde_be_before_end_at
    return unless start_at && end_at

    if start_at >= end_at
      errors.add(:start_at, "は終了よりも前に設定して下さい")
    end
  end
end
