-- AUTO-GENERATED: OP09-042 / 버기
-- rules_id=OP09-042 script_id=880001138 fingerprint=452b76077c208b7d850e5ebae1957e32bc226893e1b05c219717cdfefecf9a1b
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP09-042]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              trait=[[크로스 길드]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
          },
        },
        conditions={},
        costs={
          {
            count=5,
            op=[[REST_DON]],
          },
          {
            count=1,
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】자신의 두웅!! 5장을 레스트하고, 자신의 패 1장을 버릴 수 있다: 자신의 패에서 《크로스 길드》 특징을 가진 캐릭터 카드를 1장까지 등장시킨다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP09-042]],
    schema_version=1,
  })
end
