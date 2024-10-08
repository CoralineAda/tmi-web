# An Identity is a word or phrase used by a survey participant to self-describe. Identities have associated contexts.
class Identity
  include ActiveGraph::Node

  property :name
  property :context

  before_validation :strip_whitespace

  validates :name, presence: true
  validates :context, presence: true

  has_many :out, :personas, rel_class: :IdentifiesWith

  # Generates a hash consisting of Identities and their number of occurrences.
  def self.histogram(context)
    context = Question.from(context).context
    identities = where(context: context).query_as(:i).with('i, count{(i)-[:IDENTIFIES_WITH]-(p:Persona)} AS c').return('i.name, c').order('c DESC')
    identities.inject({}) {|accumulator,identity| accumulator[identity.values[0]] ||= 0; accumulator[identity.values[0]] += identity.values[1]; accumulator}
  end

  private

  def strip_whitespace
    self.name.strip!
  end

end
