-- AUTO-GENERATED: OP11-042 / 비토
-- rules_id=OP11-042 script_id=880001376 fingerprint=dd4a29445c44790f2f56fd55fef8586f8f0c1d23a30c3b537f0cf19bf798bf96
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP11-042]],
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
        conditions={},
        costs={
          {
            count=1,
            filter={
              trait=[[파이어탱크 해적단]],
            },
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 패에서 《파이어탱크 해적단》 특징을 가진 카드 1장을 버릴 수 있다: 이번 턴 동안, 이 캐릭터는 【속공】을 얻는다.
(이 카드는 등장한 턴에 어택할 수 있다)]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP11-042]],
    schema_version=1,
  })
end
