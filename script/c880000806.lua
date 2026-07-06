-- AUTO-GENERATED: OP06-072 / 코제트
-- rules_id=OP06-072 script_id=880000806 fingerprint=14112ac6640269ba1e2b4a3d56c25204b7d6299ff93c107870b14ff2aaf34aa6
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP06-072]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[WHILE_CONDITION]],
            keyword=[[BLOCKER]],
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
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[제르마 66]],
          },
          {
            count=2,
            op=[[FIELD_DON_BEHIND_BY_GTE]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[자신의 리더가 《제르마 66》 특징을 가지고, 자신 필드의 두웅!! 수가 상대보다 2장 이상 적을 경우, 이 캐릭터는 【블로커】를 얻는다.
(상대의 어택 선언 후, 이 카드를 레스트로 하고 어택의 대상을 이 카드로 할 수 있다)]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[OP06-072]],
    schema_version=1,
  })
end
