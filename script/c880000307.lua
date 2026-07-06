-- AUTO-GENERATED: OP02-062 / 몽키 D. 루피
-- rules_id=OP02-062 script_id=880000307 fingerprint=2f329e249c3aec469d71acbd2f4a78d2ac55da7524856841855b0238c6b0619d
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP02-062]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[RETURN_TO_HAND]],
            selector={
              count=1,
              filter={
                cost_lte=4,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[ANY]],
            },
          },
          {
            duration=[[THIS_TURN]],
            keyword=[[DOUBLE_ATTACK]],
            op=[[GAIN_KEYWORD]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
            ["then"]=true,
          },
        },
        conditions={},
        costs={
          {
            count=2,
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】/【어택 시】자신의 패 2장을 버릴 수 있다: 코스트 4 이하인 캐릭터를 1장까지 주인의 패로 되돌린다. 그 후, 이번 턴 동안, 이 캐릭터는 【더블 어택】을 얻는다.
(이 카드가 주는 대미지는 2가 된다)]],
        timings={
          [[ON_PLAY]],
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP02-062]],
    schema_version=1,
  })
end
