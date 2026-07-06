-- AUTO-GENERATED: OP02-048 / 와노쿠니
-- rules_id=OP02-048 script_id=880000293 fingerprint=dcddec832e4e6b1d05ecbda3d925f2a2b33f4994b458316bc493400d01110306
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP02-048]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[SET_DON_ACTIVE]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={
          {
            count=1,
            filter={
              trait=[[와노쿠니]],
            },
            op=[[TRASH_HAND]],
          },
          {
            op=[[REST_SELF]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】자신의 패에서 《와노쿠니》 특징을 가진 카드를 1장 버리고, 이 스테이지를 레스트할 수 있다: 자신의 두웅!!을 1장까지 액티브로 한다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP02-048]],
    schema_version=1,
  })
end
