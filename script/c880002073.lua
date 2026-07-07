-- AUTO-GENERATED: P-117 / 나미
-- rules_id=P-117 script_id=880002073 fingerprint=5058672ed6fd34964142c6231bb5bfda83b5405f9d018a904e73b7710659ecaa
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-117]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            allowed_filter={
              trait=[[이스트 블루]],
            },
            duration=[[RULE]],
            op=[[DECK_BUILD_RESTRICTION]],
            player=[[YOU]],
          },
          {
            condition={
              count=0,
              op=[[DECK_EQ]],
              player=[[YOU]],
            },
            duration=[[RULE]],
            op=[[WIN_GAME]],
            player=[[YOU]],
            replacement_for=[[DECK_OUT]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[룰상, 자신은 《이스트 블루》 특징을 가진 카드만 덱에 넣을 수 있으며, 자신의 덱이 0장이 된 경우, 자신은 패배하는 대신 승리한다.]],
        timings={
          [[RULE]],
        },
      },
      {
        actions={
          {
            count=1,
            mode=[[OPTIONAL]],
            op=[[MILL_DECK]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        don_attached=1,
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【두웅!!×1】이 리더의 어택으로 상대의 라이프에 대미지를 주었을 때, 자신의 덱 위에서 1장을 트래시에 놓을 수 있다.]],
        timings={
          [[ON_DAMAGE_TO_OPPONENT_LIFE]],
        },
      },
    },
    keywords={},
    rules_id=[[P-117]],
    schema_version=1,
  })
end
