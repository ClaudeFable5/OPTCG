-- AUTO-GENERATED: OP08-028 / 네코마무시
-- rules_id=OP08-028 script_id=880001004 fingerprint=a943b5f498b7d7d52cad7451bf7d4deeb5bb66232da86a7d31e4a3698903771c
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP08-028]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[THIS_TURN]],
            keyword=[[RUSH]],
            op=[[GAIN_KEYWORD]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={
          {
            count=7,
            op=[[OPPONENT_RESTED_CARD_COUNT_GTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】상대의 레스트 상태인 카드가 7장 이상인 경우, 이번 턴 동안, 이 캐릭터는 【속공】을 얻는다.
(이 카드는 등장한 턴에 어택할 수 있다)]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP08-028]],
    schema_version=1,
  })
end
